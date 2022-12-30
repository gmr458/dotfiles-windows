local util_loaded, util = pcall(require, "lspconfig.util")

if not util_loaded then
    print("lspconfig.util not loaded")
    return
end

local config = { root_dir = util.root_pattern("tailwind.config.js") }

if vim.fn.has("win32") == 1 then
    local bin_name = "tailwind-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config
