-- LSP for Python
require("lspconfig").pyright.setup {}

-- LSP for HTML
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require("lspconfig").html.setup {
--     capabilities = capabilities
-- }

-- LSP for JavaScript/TypeScript
require("lspconfig").tsserver.setup {}

-- LSP for Golang
require("lspconfig").gopls.setup {}

-- LSP for Rust
require("lspconfig").rust_analyzer.setup {}

