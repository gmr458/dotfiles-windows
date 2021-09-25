local HOME

if vim.fn.has("unix") == 1 then
    HOME = os.getenv("HOME")
elseif vim.fn.has("win32") == 1 then
    HOME = os.getenv("USERPROFILE")
end

local signs = {
    Error = "",
    Warning = "",
    Hint = "",
    Information = "",
}

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { prefix = "" },
})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
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
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
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

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end,
    },
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lsp" },

        -- For vsnip user.
        { name = "vsnip" },

        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer" },
    },
})

-- LSP for C/C++
require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

if vim.fn.has("win32") == 1 then
    -- LSP for CSS
    require("lspconfig").cssls.setup({
        cmd = { "vscode-css-language-server.cmd", "--stdio" },
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- LSP for HTML
    require("lspconfig").html.setup({
        cmd = { "vscode-html-language-server.cmd", "--stdio" },
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- LSP for JSON
    require("lspconfig").jsonls.setup({
        cmd = { "vscode-json-language-server.cmd", "--stdio" },
        filetypes = { "json", "jsonc" },
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                end,
            },
        },
    })

    -- LSP for C#
    local omnisharp_bin = HOME .. "\\AppData\\Local\\omnisharp-vim\\omnisharp-roslyn\\OmniSharp.exe"

    local pid = vim.fn.getpid()

    require("lspconfig").omnisharp.setup({
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- LSP for Lua
    local sumneko_root_path = HOME .. "\\.language-servers\\lua-language-server"
    local sumneko_binary = sumneko_root_path .. "\\bin\\Windows\\lua-language-server.exe"

    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    require("lspconfig").sumneko_lua.setup({
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "\\main.lua" },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { "vim", "use" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
elseif vim.fn.has("unix") == 1 then
    -- LSP for CSS
    require("lspconfig").cssls.setup({
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- LSP for HTML
    require("lspconfig").html.setup({
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- LSP for JSON
    require("lspconfig").jsonls.setup({
        filetypes = { "json", "jsonc" },
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                end,
            },
        },
    })

    -- LSP for C#
    local omnisharp_bin = HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/run"

    local pid = vim.fn.getpid()

    require("lspconfig").omnisharp.setup({
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
                diagnostics = { globals = { "vim", "use" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    preloadFileSize = 200,
                },
                telemetry = { enable = false },
            },
        },
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
end

-- LSP for Golang
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- LSP for Java
--[[ require("lspconfig").jdtls.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}) ]]

-- LSP for Python
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- LSP for Rust
require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- LSP for JavaScript/TypeScript
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- LSP for YAML
require("lspconfig").yamlls.setup({})

-- Open and close float terminal
vim.cmd([[nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>]])
vim.cmd([[tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>]])
