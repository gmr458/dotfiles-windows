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
    show_end_of_buffer = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true,
    no_bold = true,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        aerial = false,
        barbar = false,
        barbecue = {
            dim_dirname = false,
        },
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
        lsp_trouble = false,
        markdown = false,
        mason = true,
        neogit = false,
        neotest = false,
        neotree = false,
        mini = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
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
        ts_rainbow = true,
        vim_sneak = false,
        vimwiki = false,
        which_key = false,
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            NormalFloat = { bg = transparent_background and colors.none or colors.base },
            -- FloatBorder = { bg = colors.mantle, fg = colors.mantle },

            StatusLine = { bg = "NONE" },

            Pmenu = { bg = colors.crust, fg = colors.overlay2 },

            WinBar = { fg = colors.text },

            NvimTreeRootFolder = { fg = colors.mantle },
            NvimTreeFolderIcon = { fg = "#FEE082" },

            LazyNormal = { bg = colors.crust },

            CmpMenu = { bg = transparent_background and colors.none or colors.base, fg = colors.text },
            CmpMenuBorder = { bg = transparent_background and colors.none or colors.base, fg = colors.surface2 },
            CmpMenuSel = { bg = colors.sky, fg = colors.base },
            CmpDoc = { bg = transparent_background and colors.none or colors.base, fg = colors.text },
            CmpDocBorder = { bg = transparent_background and colors.none or colors.base, fg = colors.surface2 },

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

            -- LSP Virtual Text
            DiagnosticVirtualTextError = { bg = "NONE" },
            DiagnosticVirtualTextWarn = { bg = "NONE" },
            DiagnosticVirtualTextInfo = { bg = "NONE" },
            DiagnosticVirtualTextHint = { bg = "NONE" },
        }
    end,
})

vim.cmd.colorscheme("catppuccin")
