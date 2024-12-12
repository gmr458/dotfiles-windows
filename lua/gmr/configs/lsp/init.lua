local M = {}

-- local navic_attach = require('gmr.configs.lsp.navic').attach

local running_windows = vim.fn.has 'win32' == 1

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.on_attach(client, bufnr)
    local methods = vim.lsp.protocol.Methods
    local req = client.request

    client.request = function(self, method, params, handler, bufnr_req)
        if method == methods.textDocument_definition then
            return req(
                self,
                method,
                params,
                require('gmr.configs.lsp.handlers').go_to_definition,
                bufnr_req
            )
        else
            return req(self, method, params, handler, bufnr_req)
        end
    end

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

    --- --- @param keys string
    --- local function feedkeys(keys)
    ---     vim.api.nvim_feedkeys(
    ---         vim.api.nvim_replace_termcodes(keys, true, false, true),
    ---         'n',
    ---         true
    ---     )
    --- end

    local fzf_opts = {
        winopts = {
            fullscreen = true,
        },
    }

    keymap('<space>e', vim.diagnostic.open_float)
    keymap('[d', function()
        vim.diagnostic.jump { count = -1, float = true }
    end)
    keymap('[d', function()
        vim.diagnostic.jump { count = 1, float = true }
    end)
    keymap('<space>q', vim.diagnostic.setloclist)
    keymap('gd', vim.lsp.buf.definition)
    keymap('J', vim.lsp.buf.hover)
    keymap(
        'gi',
        running_windows and ':Telescope lsp_implementations<cr>'
            or function()
                require('fzf-lua').lsp_implementations(fzf_opts)
            end
    )
    keymap('K', vim.lsp.buf.signature_help)
    keymap('<space>wa', vim.lsp.buf.add_workspace_folder)
    keymap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    keymap('<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    keymap('<space>D', vim.lsp.buf.type_definition)
    keymap('<space>rn', vim.lsp.buf.rename)
    keymap(
        '<space>ca',
        running_windows and vim.lsp.buf.code_action
            or function()
                require('fzf-lua').lsp_code_actions(fzf_opts)
            end
    )
    keymap(
        'gr',
        running_windows and ':Telescope lsp_references<cr>'
            or function()
                require('fzf-lua').lsp_references(fzf_opts)
            end
    )
    keymap('<space>fo', function()
        vim.lsp.buf.format { async = true }
    end)
    keymap(
        '<leader>ds',
        running_windows and ':Telescope lsp_document_symbols<cr>'
            or function()
                require('fzf-lua').lsp_document_symbols(fzf_opts)
            end
    )
    keymap(
        '<leader>ws',
        running_windows and ':Telescope lsp_dynamic_workspace_symbols<cr>'
            or function()
                require('fzf-lua').lsp_live_workspace_symbols(fzf_opts)
            end
    )

    -- if client.supports_method(methods.textDocument_completion) then
    --     vim.lsp.completion.enable(
    --         true,
    --         client.id,
    --         bufnr,
    --         { autotrigger = false }
    --     )
    -- end

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
        keymap('<leader>ih', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end)
    end

    -- uncomment this if using dap
    -- if client.name == 'jdtls' then
    --     require('jdtls').setup_dap { hotcodereplace = 'auto' }
    --     require('jdtls.dap').setup_dap_main_class_configs()
    -- end

    -- navic_attach(client, bufnr)
end

function M.setup_diagnostic_config()
    local severity_strings = {
        [1] = 'error',
        [2] = 'warn',
        [3] = 'info',
        [4] = 'hint',
    }

    vim.diagnostic.config {
        underline = true,
        virtual_text = {
            source = false,
            spacing = 1,
            suffix = '',
            format = function(diagnostic)
                return string.format(
                    '%s: %s: %s ',
                    severity_strings[diagnostic.severity],
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

return M
