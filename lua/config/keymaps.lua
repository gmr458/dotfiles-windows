local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "m", ":bnext<CR>", opts)
-- keymap("n", "z", ":bprevious<CR>", opts)

-- Delete current buffer
vim.cmd([[nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>]])
keymap("n", "<leader>bd", ":bd!<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", "\"_dP", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "tff", ":Telescope find_files no_ignore=false<CR>", opts)
keymap("n", "tfg", ":Telescope live_grep preview=true<CR>", opts)
keymap("n", "tfr", ":Telescope oldfiles preview=false<CR>", opts)
keymap("n", "tfb", ":Telescope buffers<CR>", opts)

-- fzf.lua
-- keymap("n", "tff", ":FzfLua files<CR>", opts)

-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", opts)
vim.cmd([[tnoremap <silent> <C-n> <C-\><C-n>:NvimTreeToggle<CR>]])
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- nohlsearch
keymap("n", "<Leader>nh", ":nohlsearch<CR>", opts)

-- Toogle terminal
vim.cmd([[nnoremap <silent> <A-d> :ToggleTerm<CR>]])
vim.cmd([[tnoremap <silent> <A-d> <C-\><C-n>:ToggleTerm<CR>]])
vim.cmd([[tnoremap <silent> jk <C-\><C-n>]])

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- Hop
-- vim.api.nvim_set_keymap("n", "<Space>s", "<cmd>HopChar2<cr>", { silent = true, noremap = true })
-- vim.api.nvim_set_keymap("n", "F", "<cmd>HopPattern<cr>", { silent = true, noremap = true })

-- Insert single quotes
vim.api.nvim_set_keymap("n", "<leader>sq", "ciw'<C-r>\"'<Esc>", { silent = true, noremap = true })

-- Remove single quotes
vim.api.nvim_set_keymap("n", "<leader>usq", "di'hPl2x", { silent = true, noremap = true })

-- Insert double quotes
vim.api.nvim_set_keymap("n", "<leader>dq", "ciw\"<C-r>\"\"<Esc>", { silent = true, noremap = true })

-- Remove double quotes
vim.api.nvim_set_keymap("n", "<leader>udq", "di\"hPl2x", { silent = true, noremap = true })

-- Insert single quotes visual mode
vim.api.nvim_set_keymap("v", "<leader>sq", "xi'<Esc>pA'<Esc>", { silent = true, noremap = true })

-- Insert double quotes visual mode
vim.api.nvim_set_keymap("v", "<leader>dq", "xi\"<Esc>pA\"<Esc>", { silent = true, noremap = true })

-- Dot not yank with x
vim.keymap.set("n", "x", "\"_x")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

vim.keymap.set("n", "<space>qa", "<cmd>qa<CR>")
