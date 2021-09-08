local colors = require("tokyonight.colors").setup({})

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = { "NvimTree", "packer" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = {
            { "branch", icon = "" },
            {
                "diff",
                symbols = { added = "+", modified = "~", removed = "-" },
                color_added = colors.green,
                color_modified = colors.yellow,
                color_removed = colors.red,
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                sections = { "error", "warn", "info", "hint" },
                color_error = colors.red,
                color_warn = colors.yellow,
                color_info = colors.blue,
                color_hint = colors.green,
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
