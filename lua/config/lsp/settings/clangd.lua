local config = {
    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
        "cuda",
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "clangd.cmd"
    local cmd = { bin_name }
    config.cmd = cmd
end

return config
