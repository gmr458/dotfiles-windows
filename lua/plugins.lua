return require("packer").startup(function()
    -- packer can manage itself
    use "wbthomason/packer.nvim"

    -- colorscheme dracula
    use "Mofiqul/dracula.nvim"

    -- nvim-web-devicons: a lua fork of vim-devicons. this plugin provides the same icons as well as colors for each icon
    use "kyazdani42/nvim-web-devicons"

    -- telescope: is a highly extendable fuzzy finder over lists
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- navigator: smoothly navigate between splits and panes
    use {
        "numToStr/Navigator.nvim",
        config = function() require("Navigator").setup() end
    }

    -- LSP
    use "neovim/nvim-lspconfig"
    use "folke/lsp-colors.nvim"
    use "onsails/lspkind-nvim"
    use "glepnir/lspsaga.nvim"
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                use_lsp_diagnostic_signs = true
            }
        end
    }

    -- autocompletion
    use "hrsh7th/nvim-compe"

    -- snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"

    -- treesitter
    -- use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- rainbow parentheses for neovim using treesitter
    -- use "p00f/nvim-ts-rainbow"

    -- code formatter
    use "prettier/vim-prettier"

    -- autopairs
    use "windwp/nvim-autopairs"

    -- autotag
    -- use "windwp/nvim-ts-autotag"

    -- color highlighter for Neovim
    -- use "norcalli/nvim-colorizer.lua"

    -- indent line
    -- use "lukas-reineke/indent-blankline.nvim"

    -- a file explorer
    use "kyazdani42/nvim-tree.lua"

    -- status bar
    use "hoob3rt/lualine.nvim"

    -- buffers
    use "akinsho/nvim-bufferline.lua"

    -- comments
    use "b3nj5m1n/kommentary"

    -- gitsigns
    use "lewis6991/gitsigns.nvim"

    -- git blame
    use "f-person/git-blame.nvim"
end)
