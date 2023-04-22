local M = {}

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("lspconfig could not be loaded")
    return
end

local borderchars = {
    "┌",
    "─",
    "┐",
    "│",
    "┘",
    "─",
    "└",
    "│",
}

local config = {
    virtual_text = { source = "always" },
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { source = "always", border = borderchars },
}

vim.diagnostic.config(config)

local function goto_definition()
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    local split_cmd = "vsplit"

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end

        local first_visible_line = vim.fn.line("w0")
        local last_visible_line = vim.fn.line("w$")

        local definition = result[1]

        local buf = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(buf)

        local uri = definition.uri or definition.targetUri

        if "file://" .. filename ~= uri then
            vim.cmd(split_cmd)
        else
            local range = definition.range or definition.targetSelectionRange
            local line_definition = range.start.line

            if line_definition < first_visible_line or line_definition > last_visible_line then
                vim.cmd(split_cmd)
            end
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1], "utf-8")

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result, "utf-8")
        end
    end

    return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition()
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = borderchars })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = borderchars })

require("lspconfig.ui.windows").default_options.border = "single"

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local function attach_navic(client, bufnr)
    -- vim.g.navic_silence = true

    local filetype = vim.bo.filetype

    if client.name == "html" and (filetype == "javascriptreact" or filetype == "typescriptreact") then
        return
    end

    local ok_navic, navic = pcall(require, "nvim-navic")
    if not ok_navic then
        vim.notify("nvim-navic could not be loaded")
        return
    end

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "J", vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gi", function()
        require("telescope.builtin").lsp_implementations()
    end, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
    end, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)

    if client.server_capabilities.documentHighlightProvider then
        local guibg = "Grey35"

        if vim.o.background == "light" then
            guibg = "#D5D5D5"
        end

        vim.cmd("hi! LspReferenceRead cterm=bold ctermbg=red guibg=" .. guibg)
        vim.cmd("hi! LspReferenceText cterm=bold ctermbg=red guibg=" .. guibg)
        vim.cmd("hi! LspReferenceWrite cterm=bold ctermbg=red guibg=" .. guibg)

        vim.api.nvim_create_augroup("lsp_document_highlight", {
            clear = false,
        })

        vim.opt.updatetime = 1000

        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = "lsp_document_highlight",
        })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    attach_navic(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = require("config.lsp.servers").to_setup()

for _, server in pairs(servers) do
    local server_opts = {
        on_attach = M.on_attach,
        capabilities = capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)

    if has_custom_opts then
        server_opts = vim.tbl_deep_extend("force", server_opts, server_custom_opts)
    end

    lspconfig[server].setup(server_opts)
end

return M
