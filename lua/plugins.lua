-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(
	function()
		use 'wbthomason/packer.nvim'
		use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
	end
)
