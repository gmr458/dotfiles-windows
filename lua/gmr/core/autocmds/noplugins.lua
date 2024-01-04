vim.api.nvim_create_autocmd('VimLeave', {
    group = vim.api.nvim_create_augroup(
        'RestoreCursorShapeOnExit',
        { clear = true }
    ),
    pattern = { '*' },
    desc = 'Restores horizontal shape cursor for Alacritty on exit',
    callback = function()
        vim.opt.guicursor = 'a:hor1'
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('CleanTermMode', { clear = true }),
    pattern = { '*' },
    desc = '',
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('JsonConcealLevel0', { clear = true }),
    desc = 'Disable conceallevel and spell for JSON and JSONC',
    pattern = { 'json', 'jsonc' },
    callback = function()
        vim.opt_local.spell = false
        vim.opt_local.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('CloseWithQ', { clear = true }),
    desc = 'Close with <q>',
    pattern = {
        'help',
        'man',
        'qf',
        'query',
        'scratch',
        'spectre_panel',
    },
    callback = function(args)
        vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf })
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('HighlightOnYank', { clear = true }),
    desc = 'Highlight on yank',
    callback = function()
        -- Setting a priority higher than the LSP references one.
        vim.highlight.on_yank { higroup = 'Visual', priority = 250 }
    end,
})
