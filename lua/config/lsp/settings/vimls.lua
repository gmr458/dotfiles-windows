if vim.fn.has("win32") == 1 then
    local bin_name = "vim-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    return { cmd = cmd }
end

return {}
