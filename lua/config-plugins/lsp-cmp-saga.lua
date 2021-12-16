local HOME = os.getenv("HOME")

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- LSP Saga

    -- Async LSP Finder
    buf_set_keymap("n", "gh", ":Lspsaga lsp_finder<CR>", opts)

    -- Code Action
    buf_set_keymap("n", "<space>ca", ":Lspsaga code_action<CR>", opts)

    -- Hover Doc
    buf_set_keymap("n", "<space>K", ":Lspsaga hover_doc<CR>", opts)

    -- scroll down hover doc or scroll in definition preview
    buf_set_keymap("n", "<silent><C-f>", "<cmd> require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    -- scroll up hover doc
    buf_set_keymap("n", "<silent><C-b>", "<cmd> require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

    -- SignatureHelp
    buf_set_keymap("n", "gs", ":Lspsaga signature_help<CR>", opts)

    -- Rename
    buf_set_keymap("n", "<space>gr", ":Lspsaga rename<CR>", opts)

    -- Preview Definition
    buf_set_keymap("n", "<space>gdp", ":Lspsaga preview_definition<CR>", opts)
end

vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "ultisnips" }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = "buffer" },
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            },
        }),
    },
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP for Angular
require("lspconfig").angularls.setup({})

-- LSP for BASH
require("lspconfig").bashls.setup({})

-- LSP for C/C++
require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for C#
local omnisharp_bin = HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/run"

local pid = vim.fn.getpid()

require("lspconfig").omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for CSS
require("lspconfig").cssls.setup({
    capabilities = capabilities,
})

-- LSP for Deno
require("lspconfig").denols.setup({})

-- LSP for Golang
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for HTML
require("lspconfig").html.setup({
    capabilities = capabilities,
})

-- LSP for Java
require("lspconfig").jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for JavaScript/TypeScript
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for JSON
require("lspconfig").jsonls.setup({
    filetypes = { "json", "jsonc" },
    capabilities = capabilities,
})

-- LSP for Kotlin
require("lspconfig").kotlin_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for Lua
local sumneko_root_path = HOME .. "/.language-servers/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = runtime_path },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                preloadFileSize = 200,
            },
            telemetry = { enable = false },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for PHP
require("lspconfig").intelephense.setup({})

-- LSP for Python
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for Rust
require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- LSP for SQL
require("lspconfig").sqls.setup({})

-- Open and close float terminal
vim.cmd([[nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>]])
vim.cmd([[tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>]])
