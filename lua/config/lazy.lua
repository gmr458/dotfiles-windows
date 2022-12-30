local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
end

vim.opt.rtp:prepend(lazypath)

local build_snippets = {
    "yarn",
    "install",
    "--frozen-lockfile",
    "&&",
    "yarn",
    "compile",
}

if vim.fn.has("win32") == 1 then
    build_snippets = {
        "yarn",
        "install",
        "--frozen-lockfile",
        "&&",
        "node_modules\\.bin\\tsc",
        "--noEmit",
        "false",
        "--module",
        "commonjs",
        "--outDir",
        "lib",
    }
end

require("lazy").setup({
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("config.treesitter")
        end,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = function()
                    require("config.treesitter.context")
                end,
            },
        },
    },
    {
        "nvim-treesitter/playground",
        cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "django-html",
            "ejs",
            "glimmer",
            "handlebars",
            "hbs",
            "html",
            "htmldjango",
            "javascriptreact",
            "jsx",
            "markdown",
            "php",
            "pug",
            "rescript",
            "svelte",
            "tsx",
            "typescriptreact",
            "vue",
            "xml",
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("config.colorizer")
        end,
    },
    -- Colorschemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("config.colorschemes.catppuccin")
        end,
    },
    -- ({
    --     "wuelnerdotexe/vim-enfocado",
    --     -- config = "require('config.colorschemes.enfocado')",
    -- })
    -- ({
    --     "projekt0n/github-nvim-theme",
    --     -- config = "require('config.colorschemes.github')",
    -- })
    -- ({
    --     "ellisonleao/gruvbox.nvim",
    --     -- config = "require('config.colorschemes.gruvbox')",
    -- })
    -- ({
    --     "rebelot/kanagawa.nvim",
    --     -- config = "require('config.colorschemes.kanagawa')",
    -- })
    -- ({
    --     "marko-cerovac/material.nvim",
    --     -- config = "require('config.colorschemes.material')",
    -- })
    -- ({
    --     "navarasu/onedark.nvim",
    --     -- config = "require('config.colorschemes.onedark')",
    -- })
    -- ({
    --     "rose-pine/neovim",
    --     as = "rose-pine",
    --     config = "require('config.colorschemes.rose-pine')",
    -- })
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        cmd = "Telescope",
        config = function()
            require("config.telescope")
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspStart", "MasonInstallListPackages" },
        config = function()
            require("config.lsp.init")
        end,
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                config = function()
                    require("config.navic")
                end,
            },
            {
                "williamboman/mason.nvim",
                config = function()
                    require("config.lsp.mason")
                end,
                dependencies = {
                    {
                        "jose-elias-alvarez/null-ls.nvim",
                        config = function()
                            require("config.lsp.null-ls")
                        end,
                    },
                },
            },
            {
                "glepnir/lspsaga.nvim",
                branch = "main",
                config = function()
                    require("config.lsp.lspsaga")
                end,
            },
            {
                "folke/trouble.nvim",
                config = function()
                    require("config.trouble")
                end,
            },
        },
    },
    -- Completion
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            {
                "dsznajder/vscode-react-javascript-snippets",
                build = table.concat(build_snippets, " "),
            },
            {
                "rafamadriz/friendly-snippets",
            },
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    { "hrsh7th/cmp-nvim-lua" },
                    { "hrsh7th/cmp-nvim-lsp" },
                    { "hrsh7th/cmp-nvim-lsp-signature-help" },
                    { "saadparwaiz1/cmp_luasnip" },
                    { "hrsh7th/cmp-path" },
                    { "hrsh7th/cmp-buffer" },
                },
                config = function()
                    require("config.cmp")
                end,
            },
        },
    },
    -- -- Other plugins
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("config.gitsigns")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        cmd = "ScrollbarShow",
        config = function()
            require("config.scrollbar")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        keys = { "<C-u>", "<C-d>" },
        config = function()
            require("config.neoscroll")
        end,
    },
    {
        "feline-nvim/feline.nvim",
        config = function()
            require("config.feline")
        end,
    },
    {
        "phaazon/hop.nvim",
        branch = "v1",
        cmd = { "HopChar2", "HopPattern" },
        config = function()
            require("config.hop")
        end,
    },
    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("config.guess-indent")
        end,
    },
    { "b0o/SchemaStore.nvim" },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeFindFileToggle",
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = { default = true },
    },
    {
        "b3nj5m1n/kommentary",
        event = "BufReadPost",
        config = function()
            require("config.kommentary")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = "ToggleTerm",
        config = function()
            require("config.toggleterm")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "BufReadPost",
        config = function()
            require("config.autopairs")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
            require("config.indent-blankline")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("config.alpha")
        end,
    },
    {
        "mhartington/formatter.nvim",
        cmd = "Format",
        config = function()
            require("config.formatter")
        end,
    },
}, {
    change_detection = { enabled = false, notify = false },
})
