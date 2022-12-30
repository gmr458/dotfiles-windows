local config = {
    filetypes = {
        "django-html",
        "ejs",
        "handlebars",
        "hbs",
        "html",
        "htmldjango",
        "javascriptreact",
        "pug",
        "typescriptreact",
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "vscode-html-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config
