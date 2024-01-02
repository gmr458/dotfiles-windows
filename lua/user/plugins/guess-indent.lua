return {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPost',
    config = function()
        local guess_indent = require 'guess-indent'
        guess_indent.setup {}
    end,
}
