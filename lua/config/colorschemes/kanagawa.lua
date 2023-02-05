local kanagawa_loaded, kanagawa = pcall(require, "kanagawa")

if not kanagawa_loaded then
    print("kanagawa not loaded")
    return
end

local colors = require("kanagawa.colors").setup()

local sumiInkCustom = "#111116"

kanagawa.setup({
    undercurl = true,
    commentStyle = { italic = false, bold = false },
    functionStyle = { italic = false, bold = false },
    keywordStyle = { italic = false, bold = false },
    statementStyle = { italic = false, bold = false },
    typeStyle = { italic = false, bold = false },
    variablebuiltinStyle = { italic = false, bold = false },
    specialReturn = false,
    specialException = false,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    terminalColors = true,
    colors = {},
    overrides = {
        -- Float
        FloatBorder = { bg = colors.sumiInk1, fg = colors.sumiInk4 },
        NormalFloat = { bg = colors.sumiInk1 },

        -- Cmp
        CmpPmenuBorder = { fg = colors.sumiInk4 },

        -- StatusLine
        StatusLine = { bg = colors.sumiInk1 },

        -- NvimTree
        NvimTreeGitIgnored = { fg = colors.fujiGray },
        NvimTreeNormal = { bg = colors.sumiInk0 },
        NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NvimTreeWinSeparator = { bg = colors.sumiInk1, fg = colors.sumiInk1 },

        -- Telescope
        TelescopeBorder = { bg = sumiInkCustom, fg = sumiInkCustom },
        TelescopeNormal = { bg = sumiInkCustom },
        TelescopePreviewBorder = { bg = sumiInkCustom, fg = sumiInkCustom },
        TelescopePreviewNormal = { bg = sumiInkCustom },
        TelescopePreviewTitle = { bg = sumiInkCustom, fg = colors.fujiWhite },
        TelescopePromptBorder = { bg = sumiInkCustom, fg = sumiInkCustom },
        TelescopePromptNormal = { bg = sumiInkCustom },
        TelescopePromptTitle = { bg = sumiInkCustom, fg = colors.fujiWhite },
        TelescopeResultsTitle = { bg = sumiInkCustom, fg = colors.fujiWhite },
        TelescopeSelection = { bg = sumiInkCustom, fg = colors.springGreen },
        TelescopeMultiSelection = { bg = sumiInkCustom },

        -- ToggleTerm
        ToggleTerm1NormalFloat = { bg = sumiInkCustom },
        ToggleTerm1FloatBorder = { bg = sumiInkCustom, fg = sumiInkCustom },

        -- TreesitterContext
        TreesitterContext = { bg = colors.sumiInk2 },
        TreesitterContextLineNumber = { bg = colors.sumiInk2 },

        -- Treesitter
        TSNamespace = { fg = colors.fujiWhite },
        javascriptTSConstructor = { fg = colors.crystalBlue },

        -- LSP Saga
        LspSagaCodeActionBorder = { fg = colors.sumiInk4 },
        LspSagaLspFinderBorder = { fg = colors.sumiInk4 },
        LspSagaAutoPreview = { fg = colors.sumiInk4 },
        LspSagaDefPreviewBorder = { fg = colors.sumiInk4 },
        LspSagaRenameBorder = { fg = colors.sumiInk4 },

        -- Trouble
        TroubleCount = { bg = colors.sumiInk1 },
    },
})

vim.cmd("colorscheme kanagawa")
