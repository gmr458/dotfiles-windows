return {
    'echasnovski/mini.comment',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.comment').setup {
            options = {
                custom_commentstring = function()
                    return require('ts_context_commentstring.internal').calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
        }
    end,
}
