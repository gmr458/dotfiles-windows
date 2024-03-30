local config = {
    filetypes = {
        'astro',
        'css',
        'eruby',
        'html',
        'htmldjango',
        'javascriptreact',
        'less',
        'pug',
        'sass',
        'scss',
        'svelte',
        'typescriptreact',
        'vue',
    },
    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
    init_options = {
        html = {
            options = {
                ['output.selfClosingStyle'] = 'xhtml',
            },
        },
    },
}

return config
