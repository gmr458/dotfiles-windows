if vim.fn.isdirectory(vim.g.base46_cache) == 0 then
    require('base46').load_all_highlights()
end

dofile(vim.g.base46_cache .. 'colors')
dofile(vim.g.base46_cache .. 'defaults')
dofile(vim.g.base46_cache .. 'devicons')
dofile(vim.g.base46_cache .. 'git')
dofile(vim.g.base46_cache .. 'lsp')
dofile(vim.g.base46_cache .. 'mason')
dofile(vim.g.base46_cache .. 'nvimtree')
dofile(vim.g.base46_cache .. 'syntax')
dofile(vim.g.base46_cache .. 'telescope')
dofile(vim.g.base46_cache .. 'treesitter')

vim.api.nvim_create_user_command('Base46', function()
    require('base46').load_all_highlights()
end, {})
