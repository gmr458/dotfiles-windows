return {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    dependencies = {
        require 'gmr.plugins.ts-context-commentstring',
    },
    config = function()
        require('Comment').setup {
            pre_hook = require(
                'ts_context_commentstring.integrations.comment_nvim'
            ).create_pre_hook(),
        }
    end,
}
