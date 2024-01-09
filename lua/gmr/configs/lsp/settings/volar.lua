local util = require 'lspconfig.util'

local config = {
    filetypes = {
        'typescript',
        'javascript',
        'vue',
    },
    root_dir = util.root_pattern('src/App.vue', 'nuxt.config.ts'),
}

return config
