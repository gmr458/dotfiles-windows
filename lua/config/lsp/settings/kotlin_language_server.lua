if vim.fn.has("win32") == 1 then
    local bin_name = "kotlin-language-server.cmd"
    local cmd = { bin_name }
    return { cmd = cmd }
end

return {}
