if vim.fn.has("win32") == 1 then
    local bin_name = "vscode-css-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    return { cmd = cmd }
end

return {}
