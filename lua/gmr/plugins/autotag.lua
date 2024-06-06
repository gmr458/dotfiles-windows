return {
    'windwp/nvim-ts-autotag',
    ft = {
        'astro',
        'glimmer',
        'handlebars',
        'hbs',
        'html',
        'javascript',
        'javascriptreact',
        'jsx',
        'markdown',
        'php',
        'rescript',
        'svelte',
        'tsx',
        'twig',
        'typescript',
        'typescriptreact',
        'vue',
        'xml',
    },
    config = function()
        require('nvim-ts-autotag').setup()
    end,
}
