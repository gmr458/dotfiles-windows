local M = {}

M.to_setup = function()
    return {
        -- "angularls",
        "bashls",
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
        "rust_analyzer",
        -- "solargraph",
        "sqls",
        "sumneko_lua",
        "tailwindcss",
        "taplo",
        "tsserver",
        "vimls",
        "yamlls",
    }
end

return M
