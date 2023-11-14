local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
    vim.notify("lazy could not be loaded")
    return
end

lazy.setup({
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
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
            -- {
            --   "kevinhwang91/nvim-ufo",
            --   dependencies = { "kevinhwang91/promise-async" },
            --   config = function()
            --     require("config.ufo")
            --   end,
            --   init = function()
            --     vim.o.foldcolumn = "0"
            --     vim.o.foldlevel = 99
            --     vim.o.foldlevelstart = 99
            --     vim.o.foldenable = true
            --   end,
            -- },
        },
    },
    {
        "nvim-treesitter/playground",
        cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("config.colorizer")
        end,
    },
    -- Colorscheme
    -- {
    --     "gmr458/dark_modern.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("dark_modern").setup({
    --             cursorline = true,
    --             transparent_background = true,
    --             nvim_tree_darker = true,
    --             italic_keyword = false,
    --         })
    --         vim.cmd.colorscheme("dark_modern")
    --     end,
    -- },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("config.colorschemes.kanagawa")
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
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
        cmd = { "LspStart" },
        config = function()
            require("config.lsp.init")
        end,
        dependencies = {
            {
                "mfussenegger/nvim-lint",
                config = function()
                    require("config.lsp.lint")
                end,
            },
            {
                "williamboman/mason.nvim",
                config = function()
                    require("config.lsp.mason")
                end,
            },
            {
                "folke/neodev.nvim",
                config = function()
                    require("neodev").setup()
                end,
            },
            {
                "SmiteshP/nvim-navic",
                config = function()
                    require("config.navic")
                end,
            },
            {
                "folke/trouble.nvim",
                config = function()
                    require("config.trouble")
                end,
            },
            {
                "folke/noice.nvim",
                config = function()
                    require("config.noice")
                end,
                dependencies = { "MunifTanjim/nui.nvim" },
            },
            { "b0o/SchemaStore.nvim" },
        },
    },
    -- LSP Java
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        dependencies = {
            "williamboman/mason.nvim",
            -- "rcarriga/nvim-dap-ui",
        },
    },
    -- DAP
    -- {
    --   "rcarriga/nvim-dap-ui",
    --   cmd = { "DapContinue", "DapToggleBreakpoint" },
    --   config = function()
    --     require("config.dap")
    --   end,
    --   dependencies = {
    --     { "mfussenegger/nvim-dap" },
    --     {
    --       "mfussenegger/nvim-dap-python",
    --       config = function()
    --         require("config.dap.python")
    --       end,
    --     },
    --   },
    -- },
    -- Neotest
    -- {
    --   "nvim-neotest/neotest",
    --   cmd = { "Neotest" },
    --   config = function()
    --     require("config.neotest")
    --   end,
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     "antoinemadec/FixCursorHold.nvim",
    --     "nvim-neotest/neotest-python",
    --     "nvim-neotest/neotest-go",
    --     "nvim-neotest/neotest-jest",
    --     "marilari88/neotest-vitest",
    --     "rouge8/neotest-rust",
    --     "Issafalcon/neotest-dotnet",
    --   },
    -- },
    -- Completion
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    { "hrsh7th/cmp-nvim-lua" },
                    { "hrsh7th/cmp-nvim-lsp" },
                    { "hrsh7th/cmp-path" },
                },
                config = function()
                    require("config.cmp")
                end,
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local ok_autopairs, autopairs = pcall(require, "nvim-autopairs")
            if not ok_autopairs then
                vim.notify("nvim-autopairs could not be loaded")
                return
            end

            autopairs.setup({ map_cr = true })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("config.gitsigns")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        cmd = "ScrollbarToggle",
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
        "famiu/feline.nvim",
        config = function()
            require("config.feline")
        end,
    },
    {
        "NMAC427/guess-indent.nvim",
        event = "BufReadPost",
        config = function()
            require("config.guess-indent")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeFindFileToggle",
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "b3nj5m1n/kommentary",
        event = "BufReadPost",
        config = function()
            require("config.kommentary")
        end,
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     event = "BufReadPre",
    --     config = function()
    --         require("config.indent-blankline")
    --     end,
    -- },
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
    ui = { border = "single" },
})
