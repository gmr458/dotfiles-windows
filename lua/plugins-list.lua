return require("packer").startup(function()
    -- packer can manage itself
    use("wbthomason/packer.nvim")

    -- colorscheme gruvbox original
    -- use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

    -- gruvbox fork
    use({
        "gmr458/gruvbox.nvim",
        requires = { "rktjmp/lush.nvim" },
    })

    -- colorscheme enfocado
    use("wuelnerdotexe/vim-enfocado")

    -- github
    -- use("projekt0n/github-nvim-theme")

    -- nvim-web-devicons: a lua fork of vim-devicons. this plugin provides the same icons as well as colors for each icon
    use("kyazdani42/nvim-web-devicons")

    -- telescope: is a highly extendable fuzzy finder over lists
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- navigator: smoothly navigate between splits and panes
    use({
        "numToStr/Navigator.nvim",
        config = function()
            require("Navigator").setup()
        end,
    })

    -- LSP
    use("neovim/nvim-lspconfig")
    use("glepnir/lspsaga.nvim")
    use("onsails/lspkind-nvim")
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                use_lsp_diagnostic_signs = true,
            })
        end,
    })

    -- autocompletion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")

    -- for vsnip
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")

    -- for luasnip
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- rainbow parentheses for neovim using treesitter
    use("p00f/nvim-ts-rainbow")

    -- autopairs
    use("windwp/nvim-autopairs")

    -- autotag
    use("windwp/nvim-ts-autotag")

    -- color highlighter for Neovim
    use("norcalli/nvim-colorizer.lua")

    -- a file explorer
    use("kyazdani42/nvim-tree.lua")

    -- status bar
    -- use("hoob3rt/lualine.nvim")
    use("gmr458/lualine.nvim")

    -- buffers
    use("akinsho/nvim-bufferline.lua")

    -- comments
    use("b3nj5m1n/kommentary")

    -- formatter
    use("mhartington/formatter.nvim")

    -- git
    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
end)
