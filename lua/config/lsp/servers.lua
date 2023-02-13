local M = {}

M.to_setup = function()
    return {
        -- "angularls",
        "bashls",
        "bufls",
        "clangd",
        "cssls",
        "denols",
        "dockerls",
        "emmet_ls",
        "eslint",
        -- "golangci_lint_ls",
        "gopls",
        "html",
        "intelephense",
        "jdtls",
        "jsonls",
        "kotlin_language_server",
        "omnisharp",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        -- "solargraph",
        "sqls",
        "lua_ls",
        "tailwindcss",
        "taplo",
        "tsserver",
        "vimls",
        "yamlls",
    }
end

return M
