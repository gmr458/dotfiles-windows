return require("packer").startup(function()
    use "wbthomason/packer.nvim"
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {
        "numToStr/Navigator.nvim",
        config = function()
            require("Navigator").setup()
        end
    }
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "onsails/lspkind-nvim"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"
    use "nvim-treesitter/nvim-treesitter"
	use "p00f/nvim-ts-rainbow"
    use "prettier/vim-prettier"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "alvan/vim-closetag"
    use "norcalli/nvim-colorizer.lua"
    use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua"
    }
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "hoob3rt/lualine.nvim"
    use "akinsho/nvim-bufferline.lua"
end)
