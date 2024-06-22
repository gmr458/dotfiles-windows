return {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
        local indentscope = require 'mini.indentscope'

        indentscope.setup {
            draw = {
                delay = 0,
                animation = indentscope.gen_animation.none(),
            },
            mappings = {
                object_scope = '',
                object_scope_with_border = '',
                goto_top = '',
                goto_bottom = '',
            },
            symbol = '│',
        }
    end,
}
