vim.g.mapleader = " "

-- Modes
-- normal_mode       = "n",
-- insert_mode       = "i",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- term_mode         = "t",
-- command_mode      = "c",

---------------------------------------------------------------
-- Normal -----------------------------------------------------
---------------------------------------------------------------

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<cr>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { silent = true })

-- Navigate buffers when using bufferline
-- vim.keymap.set("n", "m", ":bnext<cr>", opts)
-- vim.keymap.set("n", "z", ":bprevious<cr>", opts)

-- Delete current buffer
vim.keymap.set("n", "<leader>bd", ":bd!<cr>", { silent = true })

-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files no_ignore=false<cr>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Telescope git_status preview=true<cr>", { silent = true })
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep preview=true<cr>", { silent = true })
vim.keymap.set("n", "<leader>ht", ":Telescope help_tags preview=true<cr>", { silent = true })
vim.keymap.set("n", "<leader>of", ":Telescope oldfiles preview=false<cr>", { silent = true })
vim.keymap.set("n", "<leader>bf", ":Telescope buffers<cr>", { silent = true })

-- fzf.lua
-- vim.keymap.set("n", "<leader>ff", ":FzfLua files<cr>", { silent = true })

-- nvim tree
vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<cr>", { silent = true })

-- nohlsearch
vim.keymap.set("n", "<leader>nh", ":nohlsearch<cr>", { silent = true })

-- insert single quotes
vim.keymap.set("n", "<leader>sq", "ciw'<C-r>\"'<esc>", { silent = true, noremap = true })

-- remove single quotes
vim.keymap.set("n", "<leader>usq", "di'hPl2x", { silent = true, noremap = true })

-- insert double quotes
vim.keymap.set("n", "<leader>dq", "ciw\"<C-r>\"\"<esc>", { silent = true, noremap = true })

-- remove double quotes
vim.keymap.set("n", "<leader>udq", "di\"hPl2x", { silent = true, noremap = true })

-- insert single quotes visual mode
vim.keymap.set("v", "<leader>sq", "xi'<esc>pA'<esc>", { silent = true, noremap = true })

-- insert double quotes visual mode
vim.keymap.set("v", "<leader>dq", "xi\"<esc>pA\"<esc>", { silent = true, noremap = true })

-- dot not yank with x
vim.keymap.set("n", "x", "\"_x")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- close folded code
vim.keymap.set("n", "<leader>fc", "<cmd>foldclose<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- toogle terminal
vim.keymap.set("n", "<A-d>", ":ToggleTerm<cr>", { silent = true })

vim.keymap.set("n", "<leader>f", function()
    require("conform").format()
end, { noremap = true, silent = true })

---------------------------------------------------------------
-- Insert -----------------------------------------------------
---------------------------------------------------------------

vim.keymap.set("i", "jk", "<esc>")

---------------------------------------------------------------
-- Visual -----------------------------------------------------
---------------------------------------------------------------

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Remember copied elements when pasted in visual mode
vim.keymap.set("v", "p", "\"_dP", { noremap = true, silent = true })

---------------------------------------------------------------
-- Terminal ---------------------------------------------------
---------------------------------------------------------------

-- toogle terminal
vim.keymap.set("t", "<A-d>", "<C-\\><C-n>:ToggleTerm<cr>")

vim.keymap.set("t", "jk", "<C-\\><C-n>")
