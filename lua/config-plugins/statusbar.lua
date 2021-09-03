local colors = require("tokyonight.colors").setup({})

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
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
            {
                function()
                    local msg = "No active LSP"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = " LSP:",
                color = { fg = colors.fg, gui = "bold" },
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
