return {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    config = function()
        require('ts_context_commentstring').setup {
            enable_autocmd = false,
        }
    end,
}
