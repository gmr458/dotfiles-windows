return {
    'folke/trouble.nvim',
    config = function()
        local trouble = require 'trouble'
        trouble.setup()
    end,
}
