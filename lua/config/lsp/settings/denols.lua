local util_loaded, util = pcall(require, "lspconfig.util")

if not util_loaded then
    print("lspconfig.util not loaded")
    return
end

local config = {
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
    single_file_support = false,
}

if vim.fn.has("win32") == 1 then
    local bin_name = "deno.cmd"
    local cmd = { bin_name, "lsp" }
    config.cmd = cmd
end

return config
