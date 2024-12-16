vim.g.mapleader = ' '

require 'gmr.core.keymaps.colorizer'
-- require 'gmr.core.keymaps.dap'
require 'gmr.core.keymaps.grapple'
require 'gmr.core.keymaps.grapple'
-- require 'gmr.core.keymaps.neotest'
require 'gmr.core.keymaps.neovim'
require 'gmr.core.keymaps.nvim-tree'

-- if vim.fn.has 'win32' == 1 then
require 'gmr.core.keymaps.telescope'
-- else
--     require 'gmr.core.keymaps.fzf'
-- end
