return {
    'petertriho/nvim-scrollbar',
    cmd = 'ScrollbarShow',
    config = function()
        local scrollbar = require 'scrollbar'

        scrollbar.setup {
            marks = {
                Cursor = { text = '-' },
                GitAdd = { text = '│' },
                GitChange = { text = '│' },
                GitDelete = { text = '_' },
            },
            excluded_filetypes = {
                'prompt',
                'TelescopePrompt',
                'noice',
                'NvimTree',
                'lspsagafinder',
                'alpha',
                'cmp_docs',
                'cmp_menu',
            },
            handlers = {
                cursor = true,
                diagnostic = false,
                gitsigns = true,
                handle = true,
                search = false, -- Requires hlslens
            },
        }
    end,
}
