if vim.fn.has("win32") == 1 then
    local bin_name = "bash-language-server.cmd"
    local cmd = { bin_name, "start" }
    return { cmd = cmd }
end

return {}
