if vim.fn.has("win32") == 1 then
    local bin_name = "intelephense.cmd"
    local cmd = { bin_name, "--stdio" }
    return { cmd = cmd }
end

return {}
