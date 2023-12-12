vim.g.mapleader = ' '

-- modes
-- normal_mode       = "n",
-- insert_mode       = "i",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- term_mode         = "t",
-- command_mode      = "c",

---------------------------------------------------------------
-- normal -----------------------------------------------------
---------------------------------------------------------------

-- better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<cr>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize +2<cr>', { silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<cr>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<cr>', { silent = true })

-- delete current buffer
vim.keymap.set('n', '<leader>bd', ':bd!<cr>', { silent = true })

-- telescope
vim.keymap.set(
    'n',
    '<leader>ff',
    ':Telescope find_files no_ignore=false<cr>',
    { silent = true }
)
vim.keymap.set(
    'n',
    '<leader>gs',
    ':Telescope git_status preview=true<cr>',
    { silent = true }
)
vim.keymap.set(
    'n',
    '<leader>lg',
    ':Telescope live_grep preview=true<cr>',
    { silent = true }
)
vim.keymap.set(
    'n',
    '<leader>ht',
    ':Telescope help_tags preview=true<cr>',
    { silent = true }
)
vim.keymap.set(
    'n',
    '<leader>of',
    ':Telescope oldfiles preview=false<cr>',
    { silent = true }
)
vim.keymap.set('n', '<leader>bf', ':Telescope buffers<cr>', { silent = true })

-- nvim tree
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<cr>', { silent = true })

-- nohlsearch
vim.keymap.set('n', '<leader>nh', ':nohlsearch<cr>', { silent = true })

-- insert single quotes
vim.keymap.set(
    'n',
    '<leader>sq',
    'ciw\'<C-r>"\'<esc>',
    { silent = true, noremap = true }
)

-- remove single quotes
vim.keymap.set(
    'n',
    '<leader>usq',
    'di\'hPl2x',
    { silent = true, noremap = true }
)

-- insert double quotes
vim.keymap.set(
    'n',
    '<leader>dq',
    'ciw"<C-r>""<esc>',
    { silent = true, noremap = true }
)

-- remove double quotes
vim.keymap.set(
    'n',
    '<leader>udq',
    'di"hPl2x',
    { silent = true, noremap = true }
)

-- insert single quotes visual mode
vim.keymap.set(
    'v',
    '<leader>sq',
    'xi\'<esc>pA\'<esc>',
    { silent = true, noremap = true }
)

-- insert double quotes visual mode
vim.keymap.set(
    'v',
    '<leader>dq',
    'xi"<esc>pA"<esc>',
    { silent = true, noremap = true }
)

-- dot not yank with x
vim.keymap.set('n', 'x', '"_x')

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- close folded code
vim.keymap.set('n', '<leader>fc', '<cmd>foldclose<cr>')

-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- switch background
vim.keymap.set('n', '<leader>sb', function()
    if vim.o.background == 'dark' then
        vim.opt.background = 'light'
    else
        vim.opt.background = 'dark'
    end
end)

-- colorizer toggle
vim.keymap.set('n', '<leader>ct', '<cmd>ColorizerToggle<cr>')

-- open terminal
vim.keymap.set('n', '<leader>vt', [[<cmd>vsplit | term<cr>A]])
vim.keymap.set('n', '<leader>ht', [[<cmd>split | term<cr>A]])

-- format
vim.keymap.set('n', '<leader>f', ':Format<cr>')

---------------------------------------------------------------
-- insert -----------------------------------------------------
---------------------------------------------------------------

-- enter normal mode
vim.keymap.set('i', 'jk', '<esc>')

---------------------------------------------------------------
-- visual -----------------------------------------------------
---------------------------------------------------------------

-- stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- remember copied elements when pasted in visual mode
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true })

---------------------------------------------------------------
-- terminal ---------------------------------------------------
---------------------------------------------------------------

vim.keymap.set('t', 'jk', '<C-\\><C-n>')
