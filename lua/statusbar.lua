local dracula_black = require("lualine.themes.dracula-black")

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = dracula_black,
        component_separators = {"", ""},
        section_separators = {"", ""},
        disabled_filetypes = {"NvimTree", "packer"}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"filename"},
        lualine_c = {
            {
                "branch",
                icon = ""
            },
            {
                "diff",
                symbols = {added = "+", modified = "~", removed = "-"},
                color_added = "#10B981",
                color_modified = "#E0AF68",
                color_removed = "#db4b4b"
            }
        },
        lualine_x = {
            {
                "diagnostics",
                sources = {"nvim_lsp"},
                sections = {"error", "warn", "info", "hint"},
                color_error = "#DB4B4B",
                color_warn = "#E0AF68",
                color_info = "#0DB9D7",
                color_hint = "#10B981"
            },
            {"filetype"}
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
