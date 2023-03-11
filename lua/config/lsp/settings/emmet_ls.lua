local config = {
    filetypes = {
        -- "css",
        "django-html",
        "ejs",
        "handlebars",
        "hbs",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "typescriptreact",
    },
    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
    init_options = {
        html = {
            options = {
                ["output.selfClosingStyle"] = "xhtml",
            },
        },
        javascriptreact = {
            options = {
                ["output.selfClosingStyle"] = "xhtml",
                ["jsx.enabled"] = true,
            },
        },
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "emmet-ls.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config
