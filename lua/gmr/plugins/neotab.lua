return {
    'kawre/neotab.nvim',
    event = 'InsertEnter',
    config = function()
        require('neotab').setup {}
    end,
}
