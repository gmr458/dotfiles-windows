if vim.fn.has("win32") == 1 then
    local bin_name = "gopls.cmd"
    local cmd = { bin_name }
    return { cmd = cmd }
end

return {}
