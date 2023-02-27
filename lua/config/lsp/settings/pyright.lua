local config = {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
            },
        },
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "pyright-langserver.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config
