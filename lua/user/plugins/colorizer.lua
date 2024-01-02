return {
    'NvChad/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function()
        local colorizer = require 'colorizer'

        colorizer.setup {
            filetypes = {
                'conf',
                'css',
                'html',
                'javascript',
                'json',
                'jsonc',
                'lua',
                'yaml',
            },
            user_default_options = {
                RGB = true,
                RRGGBB = true,
                names = false,
                RRGGBBAA = true,
                AARRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
                mode = 'virtualtext',
                virtualtext = ' ■',
            },
        }
    end,
}
