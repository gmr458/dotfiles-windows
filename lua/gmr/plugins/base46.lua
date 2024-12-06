return {
    'NvChad/base46',
    lazy = true,
    build = function()
        require('base46').load_all_highlights()
    end,
}
