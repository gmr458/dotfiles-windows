local M = {}

M.palette = function()
    local colors = require("catppuccin.palettes").get_palette()

    -- bg and fg are mandatory
    colors.bg = "NONE"
    colors.fg = colors.text

    return colors
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        {
            provider = "█ ",
            hl = { bg = "crust", fg = "blue" },
        },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    style = "NONE",
                    bg = "crust",
                }
            end,
            icon = "",
            right_sep = { { str = " ", hl = { bg = "crust" } } },
        },
        {
            provider = { name = "file_info", opts = { file_readonly_icon = " ", file_modified_icon = "" } },
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = {
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
                { str = " ", hl = { bg = "crust" } },
            },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        -- {
        --     provider = "file_size",
        --     hl = { bg = "crust", fg = "fg", style = "NONE" },
        --     left_sep = { { str = " ", hl = { bg = "crust" } } },
        --     right_sep = {
        --         { str = " ", hl = { bg = "crust" } },
        --         { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
        --     },
        -- },
        {
            provider = { name = "file_type", opts = { case = "lowercase" } },
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = { { str = " ", hl = { bg = "crust" } } },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        {
            provider = function()
                return ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc)
            end,
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = { { str = " ", hl = { bg = "crust" } } },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        {
            provider = function()
                return ((vim.bo.fileformat ~= "" and vim.bo.fileformat) or vim.o.fileformat)
            end,
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = { { str = " ", hl = { bg = "crust" } } },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { bg = "crust", fg = "green" },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { bg = "crust", fg = "yellow" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { bg = "crust", fg = "red" },
        },
        {
            provider = "git_branch",
            icon = { str = " ", hl = { fg = "peach" } },
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = { { str = " ", hl = { bg = "crust" } } },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        {
            provider = function()
                local total_lines = vim.fn.line("$")
                local total_visible_lines = vim.fn.line("w$")

                if total_lines <= total_visible_lines then
                    return ""
                end

                return total_lines .. " lines"
            end,
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            left_sep = { { str = " ", hl = { bg = "crust" } } },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right_thin", hl = { bg = "crust", fg = "overlay2" } },
            },
        },
        {
            provider = "line_percentage",
            hl = { bg = "crust", style = "NONE" },
            left_sep = {
                { str = " ", hl = { bg = "crust" } },
            },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right", hl = { bg = "NONE", fg = "crust" } },
            },
        },
    }

    components.active[2] = {
        {
            provider = "lsp_client_names",
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            -- left_sep = {
            --     { str = " ", hl = { bg = "crust" } },
            -- },
            left_sep = {
                { str = "slant_left", hl = { bg = "NONE", fg = "crust" } },
                { str = " ", hl = { bg = "crust" } },
            },
        },
        {
            provider = function()
                local lsp = vim.lsp.util.get_progress_messages()[1]

                if lsp then
                    local msg = lsp.message or ""
                    local percentage = lsp.percentage or 0
                    local title = lsp.title or ""

                    local spinners = { "", "", "" }

                    local success_icon = { "", "", "" }

                    local ms = vim.loop.hrtime() / 1000000
                    local frame = math.floor(ms / 120) % #spinners

                    if percentage >= 70 then
                        return string.format("%%<%s %s %s (%s%%%%)", success_icon[frame + 1], title, msg, percentage)
                    end

                    return string.format("%%<%s %s %s (%s%%%%)", spinners[frame + 1], title, msg, percentage)
                end

                return ""
            end,
            hl = { bg = "crust", fg = "rosewater" },
            left_sep = {
                { str = " ", hl = { bg = "crust" } },
            },
        },
        {
            provider = "diagnostic_errors",
            hl = { bg = "crust", fg = "red" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { bg = "crust", fg = "yellow" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { bg = "crust", fg = "rosewater" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { bg = "crust", fg = "blue" },
            icon = "  ",
        },
        {
            provider = "█",
            hl = { bg = "crust", fg = "blue" },
            left_sep = {
                { str = " ", hl = { bg = "crust" } },
            },
        },
    }

    components.inactive[1] = {
        {
            provider = "█ ",
            hl = { bg = "crust", fg = "blue" },
        },
        {
            provider = "file_type",
            hl = { bg = "crust", fg = "fg", style = "NONE" },
            right_sep = {
                { str = " ", hl = { bg = "crust" } },
                { str = "slant_right", hl = { bg = "NONE", fg = "crust" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        {
            provider = "█",
            hl = { fg = "blue" },
        },
    }

    return components
end

return M
