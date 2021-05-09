-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(
	function()
		use 'wbthomason/packer.nvim'
		use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
		use {
			'lewis6991/gitsigns.nvim',
			requires = {
				'nvim-lua/plenary.nvim'
			}
		}
	end
)
