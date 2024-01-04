return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        local autopairs = require 'nvim-autopairs'
        autopairs.setup { map_cr = true }
    end,
}
