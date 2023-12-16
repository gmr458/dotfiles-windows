local M = {}

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    vim.notify 'lspconfig could not be loaded'
    return
end

local methods = vim.lsp.protocol.Methods
local chars = require 'config.lsp.chars'
local handlers = require 'config.lsp.handlers'

vim.diagnostic.config {
    underline = true,
    virtual_text = {
        source = false,
        spacing = 1,
        prefix = '',
        suffix = '',
        format = function(diagnostic)
            local severity = vim.diagnostic.severity[diagnostic.severity]
            local icon = chars.diagnostics[severity]
            return string.format(
                '%s %s: %s ',
                icon,
                diagnostic.source,
                diagnostic.message
            )
        end,
    },
    signs = false,
    -- float = { source = 'always', border = chars.border },
    float = { source = 'always', border = 'single' },
    update_in_insert = false,
    severity_sort = true,
}

vim.lsp.handlers[methods.textDocument_definition] = handlers.goto_definition()

-- comment this if using noice.nvim
-- vim.lsp.handlers[methods.textDocument_hover] =
--     vim.lsp.with(vim.lsp.handlers.hover, { border = chars.border })

vim.lsp.handlers[methods.textDocument_signatureHelp] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })

require('lspconfig.ui.windows').default_options.border = 'single'

--- @param client lsp.Client
--- @param bufnr integer
function M.on_attach(client, bufnr)
    vim.api.nvim_set_option_value(
        'omnifunc',
        'v:lua.vim.lsp.omnifunc',
        { buf = bufnr }
    )

    --- @param lhs string
    --- @param rhs string|function
    local function keymap(lhs, rhs)
        vim.keymap.set(
            'n',
            lhs,
            rhs,
            { noremap = true, silent = true, buffer = bufnr }
        )
    end

    keymap('<space>e', vim.diagnostic.open_float)
    keymap('[d', vim.diagnostic.goto_prev)
    keymap(']d', vim.diagnostic.goto_next)
    keymap('<space>q', vim.diagnostic.setloclist)
    keymap('gd', vim.lsp.buf.definition)
    keymap('J', vim.lsp.buf.hover)
    keymap('gi', function()
        require('fzf-lua').lsp_implementations {
            prompt = '   LSP Implementations ❯ ',
        }
    end)
    keymap('K', vim.lsp.buf.signature_help)
    keymap('<space>wa', vim.lsp.buf.add_workspace_folder)
    keymap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    keymap('<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    keymap('<space>D', vim.lsp.buf.type_definition)
    keymap('<space>rn', vim.lsp.buf.rename)
    -- keymap('<space>ca', vim.lsp.buf.code_action)
    keymap('<space>ca', function()
        require('fzf-lua').lsp_code_actions()
    end)
    keymap('gr', function()
        require('fzf-lua').lsp_references { prompt = '   LSP References ❯ ' }
    end)
    -- keymap('<space>f', function()
    --     vim.lsp.buf.format { async = true }
    -- end)
    keymap('<leader>ds', function()
        require('fzf-lua').lsp_document_symbols {
            prompt = '   LSP Documents Symbols ❯ ',
        }
    end)
    keymap('<leader>ws', function()
        require('fzf-lua').lsp_live_workspace_symbols {
            prompt = '   LSP Live Workspace Symbols ❯ ',
        }
    end)

    if client.supports_method(methods.textDocument_declaration) then
        keymap('gD', vim.lsp.buf.declaration)
    end

    if client.supports_method(methods.textDocument_documentHighlight) then
        local augroup = vim.api.nvim_create_augroup('LspDocumentHighlight', {
            clear = false,
        })

        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = augroup,
            desc = 'Highlight references under the cursor',

            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = augroup,
            desc = 'Clear highlight references after move cursor',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    -- if client.name == 'jdtls' then
    --     -- jdtls dap
    --     -- require("jdtls").setup_dap({ hotcodereplace = "auto" })
    --     -- require("jdtls.dap").setup_dap_main_class_configs()

    --     -- jdtls commands
    --     -- require("jdtls.setup").add_commands()
    --     -- vim.api.nvim_create_user_command("JdtTestClass", function()
    --     --   require("jdtls").test_class()
    --     -- end, {})
    --     -- vim.api.nvim_create_user_command("JdtTestNearestMethod", function()
    --     --   require("jdtls").test_nearest_method()
    --     -- end, {})

    -- end

    require('config.lsp.navic').attach(client, bufnr)
end

local servers = require('config.lsp.servers').to_setup

for _, server in pairs(servers) do
    local server_opts = {
        on_attach = M.on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }

    local has_custom_opts, server_custom_opts =
        pcall(require, 'config.lsp.settings.' .. server)
    if has_custom_opts then
        server_opts =
            vim.tbl_deep_extend('force', server_opts, server_custom_opts)
    end

    local has_custom_commands, server_custom_commands =
        pcall(require, 'config.lsp.commands.' .. server)
    if has_custom_commands then
        server_opts.commands = server_custom_commands
    end

    lspconfig[server].setup(server_opts)
end

return M
