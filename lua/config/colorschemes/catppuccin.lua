local catppuccin_loaded, catppuccin = pcall(require, "catppuccin")

if not catppuccin_loaded then
    print("catppuccin not loaded")
    return
end

local transparent_background = true

catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = transparent_background,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            NormalFloat = { bg = colors.mantle },
            FloatBorder = { bg = colors.mantle, fg = colors.mantle },

            StatusLine = { bg = "NONE" },

            WinBar = { fg = colors.text },

            NvimTreeRootFolder = { fg = colors.mantle },

            CmpMenu = { bg = transparent_background and colors.none or colors.base, fg = colors.text },
            CmpMenuBorder = { bg = transparent_background and colors.none or colors.base, fg = colors.surface2 },
            CmpMenuSel = { bg = colors.sky, fg = colors.base },
            CmpDoc = { bg = transparent_background and colors.none or colors.base, fg = colors.text },
            CmpDocBorder = { bg = transparent_background and colors.none or colors.base, fg = colors.surface2 },

            -- Treesitter
            ["@constant.builtin"] = { style = { "italic" } },
            ["@function.builtin"] = { style = { "italic" } },
            ["@keyword.operator"] = { style = { "italic" } },
            ["@method.call"] = { link = "", style = { "italic" } },
            ["@namespace"] = { style = {} },
            ["@parameter"] = { style = {} },
            ["@type.builtin"] = { style = { "italic" } },
            ["@variable.builtin"] = { style = { "italic" } },

            -- TreesitterContext
            TreesitterContext = { bg = colors.surface0 },
            TreesitterContextLineNumber = { bg = colors.surface0 },

            -- Telescope
            TelescopeBorder = { bg = colors.crust, fg = colors.crust },
            TelescopeNormal = { bg = colors.crust },

            -- Telescope Preview
            TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.mantle },
            TelescopePreviewTitle = { bg = colors.mantle, fg = colors.text },

            -- Telescope Prompt
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopePromptTitle = { bg = colors.surface0, fg = colors.text },

            -- Telescope Selection
            TelescopeSelection = { bg = colors.crust, fg = colors.green },
            TelescopeMultiSelection = { bg = colors.crust },

            -- ToggleTerm
            ToggleTerm1NormalFloat = { bg = colors.crust },
            ToggleTerm1FloatBorder = { bg = colors.crust, fg = colors.crust },

            -- LSP Saga
            LspFloatWinNormal = { bg = "NONE" },

            -- Trouble
            TroubleCount = { bg = colors.base },

            -- LSP Virtual Text
            DiagnosticVirtualTextError = { bg = "NONE" },
            DiagnosticVirtualTextWarn = { bg = "NONE" },
            DiagnosticVirtualTextInfo = { bg = "NONE" },
            DiagnosticVirtualTextHint = { bg = "NONE" },
        }
    end,
    integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        cmp = true,
        dap = {
            enabled = false,
            enable_ui = false,
        },
        dashboard = true,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        hop = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        leap = false,
        lightspeed = false,
        illuminate = false,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = false,
        mason = true,
        neogit = false,
        neotest = false,
        neotree = false,
        mini = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        },
        navic = {
            enabled = true,
            custom_bg = "NONE",
        },
        noice = false,
        notify = false,
        nvimtree = true,
        overseer = false,
        pounce = false,
        semantic_tokens = false,
        symbols_outline = false,
        telekasten = false,
        telescope = false,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = false,
    },
})

vim.cmd.colorscheme("catppuccin")
