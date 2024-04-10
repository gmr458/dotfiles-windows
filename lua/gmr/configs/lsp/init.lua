local M = {}

local fzf_lua = require 'fzf-lua'
local navic_attach = require('gmr.configs.lsp.navic').attach

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.on_attach(client, bufnr)
    local methods = vim.lsp.protocol.Methods

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

    local fzf_opts = {
        winopts = {
            fullscreen = true,
        },
    }

    keymap('<space>e', vim.diagnostic.open_float)
    keymap('[d', vim.diagnostic.goto_prev)
    keymap(']d', vim.diagnostic.goto_next)
    keymap('<space>q', vim.diagnostic.setloclist)
    keymap('gd', vim.lsp.buf.definition)
    keymap('J', vim.lsp.buf.hover)
    keymap('gi', function()
        fzf_lua.lsp_implementations(fzf_opts)
    end)
    keymap('K', vim.lsp.buf.signature_help)
    keymap('<space>wa', vim.lsp.buf.add_workspace_folder)
    keymap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    keymap('<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    keymap('<space>D', vim.lsp.buf.type_definition)
    keymap('<space>rn', vim.lsp.buf.rename)
    keymap('<space>ca', function()
        fzf_lua.lsp_code_actions(fzf_opts)
    end)
    keymap('gr', function()
        fzf_lua.lsp_references(fzf_opts)
    end)
    keymap('<space>fo', function()
        vim.lsp.buf.format { async = true }
    end)
    keymap('<leader>ds', function()
        fzf_lua.lsp_document_symbols(fzf_opts)
    end)
    keymap('<leader>ws', function()
        fzf_lua.lsp_live_workspace_symbols(fzf_opts)
    end)

    if client.supports_method(methods.textDocument_declaration) then
        keymap('gD', vim.lsp.buf.declaration)
    end

    if client.supports_method(methods.textDocument_documentHighlight) then
        local augroup = vim.api.nvim_create_augroup(
            'gmr_lsp_document_highlight',
            { clear = false }
        )

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

    if client.supports_method(methods.textDocument_inlayHint) then
        vim.lsp.inlay_hint.enable(bufnr, false)

        keymap('<leader>ih', function()
            vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
        end)
    end

    navic_attach(client, bufnr)
end

function M.setup_diagnostic_config()
    local diagnostics_icons = {
        ERROR = '',
        WARN = '',
        HINT = '',
        INFO = '',
    }

    vim.diagnostic.config {
        underline = true,
        virtual_text = {
            source = false,
            spacing = 1,
            prefix = '',
            suffix = '',
            format = function(diagnostic)
                local severity = vim.diagnostic.severity[diagnostic.severity]
                local icon = diagnostics_icons[severity]
                return string.format(
                    '%s %s: %s ',
                    icon,
                    diagnostic.source,
                    diagnostic.message
                )
            end,
        },
        signs = false,
        float = { source = true, border = 'single' },
        update_in_insert = false,
        severity_sort = true,
    }
end

function M.setup_handlers()
    local methods = vim.lsp.protocol.Methods
    local handlers = require 'gmr.configs.lsp.handlers'

    vim.lsp.handlers[methods.textDocument_definition] =
        handlers.goto_definition()

    vim.lsp.handlers[methods.textDocument_hover] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'single', max_width = 90 }
    )

    vim.lsp.handlers[methods.textDocument_signatureHelp] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
end

return M
