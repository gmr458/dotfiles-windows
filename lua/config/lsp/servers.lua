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
    "gopls",
    "html",
    "intelephense",
    "jsonls",
    -- "kotlin_language_server",
    "nim_langserver",
    "ocamllsp",
    "omnisharp",
    "pyright",
    "rust_analyzer",
    -- "solargraph",
    "svelte",
    "lua_ls",
    "tailwindcss",
    "taplo",
    "tsserver",
    "vimls",
    "yamlls",
  }
end

return M
