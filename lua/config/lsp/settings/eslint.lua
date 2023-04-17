local ok, util = pcall(require, "lspconfig.util")
if not ok then
    vim.notify("lspconfig.util could not be loaded")
    return
end

local config = {
    root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json"),
    single_file_support = false,
}

if vim.fn.has("win32") == 1 then
    local bin_name = "vscode-eslint-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config
