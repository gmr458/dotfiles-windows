local kanagawa_options = require("config.colorschemes.kanagawa").kanagawa_options
local colors = require("kanagawa.colors").setup(kanagawa_options)

local M = {}

M.palette = function()
    local theme = vim.o.background
    local palette = colors.palette

    return {
        bg = theme == "dark" and palette.dragonBlack0 or palette.lotusWhite0,
        fg = theme == "dark" and palette.fujiGray or palette.lotusInk1,
        vi_mode_bg = colors.palette.waveBlue2,
        vi_mode_fg = theme == "dark" and palette.dragonBlack0 or palette.lotusWhite0,
    }
end

local diagnostic = {
    error = colors.theme.diag.error,
    warn = colors.theme.diag.warning,
    info = colors.theme.diag.info,
    hint = colors.theme.diag.hint,
}

local git = {
    added = colors.theme.vcs.added,
    deleted = colors.theme.vcs.removed,
    changed = colors.theme.vcs.changed,
}

local function get_diagnostics_count(severity)
    return vim.tbl_count(vim.diagnostic.get(0, severity and { severity = severity }))
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        {
            provider = " ",
            hl = { bg = "vi_mode_bg" },
        },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    style = "NONE",
                    bg = "vi_mode_bg",
                    fg = "vi_mode_fg",
                }
            end,
            icon = "",
        },
        {
            provider = " ",
            hl = { bg = "vi_mode_bg" },
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local buf = vim.api.nvim_get_current_buf()
                local buf_clients = vim.lsp.get_active_clients({ bufnr = buf })
                if next(buf_clients) == nil then
                    return ""
                end

                for _, client in pairs(buf_clients) do
                    if client.name == "pyright" then
                        local virtual_env = os.getenv("VIRTUAL_ENV_PROMPT")
                        if virtual_env == nil then
                            return ""
                        end

                        virtual_env = virtual_env:gsub("%s+", "")
                        return virtual_env
                    end
                end

                return ""
            end,
            left_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local buf = vim.api.nvim_get_current_buf()
                local buf_clients = vim.lsp.get_active_clients({ bufnr = buf })
                if next(buf_clients) == nil then
                    return ""
                end

                local buf_client_names = {}
                for _, client in pairs(buf_clients) do
                    if client.name ~= "null-ls" then
                        table.insert(buf_client_names, client.name)
                    end
                end

                local unique_client_names = vim.fn.uniq(buf_client_names)
                return table.concat(unique_client_names, " ")
            end,
            left_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local buf_clients = vim.lsp.get_active_clients()

                if next(buf_clients) == nil then
                    return ""
                end

                local null_ls_running = false

                for _, client in pairs(buf_clients) do
                    if client.name == "null-ls" then
                        null_ls_running = true
                    end
                end

                if not null_ls_running then
                    return ""
                end

                local filetype = vim.bo.filetype

                local ok, sources = pcall(require, "null-ls.sources")
                if not ok then
                    return ""
                end

                local available_sources = sources.get_available(filetype)

                local sources_registered = {}
                for _, source in ipairs(available_sources) do
                    table.insert(sources_registered, source.name)
                end

                return table.concat(sources_registered, " ")
            end,
            left_sep = " ",
            right_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local count = get_diagnostics_count(vim.diagnostic.severity.ERROR)
                if count > 0 then
                    return " " .. tostring(count)
                end

                return ""
            end,
            hl = { fg = diagnostic.error },
            left_sep = " ",
            right_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local count = get_diagnostics_count(vim.diagnostic.severity.WARN)
                if count > 0 then
                    return " " .. tostring(count)
                end

                return ""
            end,
            hl = { fg = diagnostic.warn },
            left_sep = " ",
            right_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local count = get_diagnostics_count(vim.diagnostic.severity.HINT)
                if count > 0 then
                    return " " .. tostring(count)
                end

                return ""
            end,
            hl = { fg = diagnostic.hint },
            left_sep = " ",
            right_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") then
                    return ""
                end

                local count = get_diagnostics_count(vim.diagnostic.severity.INFO)
                if count > 0 then
                    return " " .. tostring(count)
                end

                return ""
            end,
            hl = { fg = diagnostic.info },
            left_sep = " ",
            right_sep = " ",
        },
        {
            provider = function()
                if not rawget(vim, "lsp") or vim.lsp.status then
                    return ""
                end

                local lsp = vim.lsp.util.get_progress_messages()[1]

                if lsp then
                    local msg = (lsp.message ~= nil and string.find(lsp.message, "%%") == nil and lsp.message) or ""
                    local percentage = lsp.percentage or 0
                    local title = lsp.title or ""

                    local spinners = { "", "󰀚", "" }

                    local success_icon = { "", "", "" }

                    local ms = vim.loop.hrtime() / 1000000
                    local frame = math.floor(ms / 120) % #spinners

                    if percentage >= 70 then
                        return string.format(" %%<%s %s %s (%s%%%%)", success_icon[frame + 1], title, msg, percentage)
                    end

                    return string.format(" %%<%s %s %s (%s%%%%)", spinners[frame + 1], title, msg, percentage)
                end

                return ""
            end,
            hl = { fg = diagnostic.info },
        },
    }
    components.active[2] = {
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { fg = git.added },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { fg = git.changed },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = git.deleted },
        },
        {
            provider = "git_branch",
            icon = { str = " ", hl = { fg = colors.palette.surimiOrange } },
            left_sep = "  ",
            right_sep = " ",
        },
        {
            provider = function()
                local current_line = vim.api.nvim_win_get_cursor(0)[1]
                local lines = vim.api.nvim_buf_line_count(0)

                return string.format("%d%%%%", math.ceil(current_line / lines * 100))
            end,
            left_sep = " ",
            right_sep = " ",
        },
        -- {
        --     provider = function()
        --         local total_lines = vim.fn.line("$")
        --         local total_visible_lines = vim.fn.line("w$")

        --         if total_lines <= total_visible_lines then
        --             return ""
        --         end

        --         return total_lines .. " lines"
        --     end,
        --     icon = " ",
        --     right_sep = " ",
        --     left_sep = " ",
        -- },
        -- {
        --     provider = { name = "file_info", opts = { file_readonly_icon = " ", file_modified_icon = "" } },
        --     right_sep = " ",
        --     left_sep = " ",
        -- },
        -- {
        --     provider = function()
        --         local word = vim.bo.expandtab and "Spaces" or "Tab Size"
        --         return word .. ": " .. ((vim.bo.tabstop ~= "" and vim.bo.tabstop) or vim.o.tabstop)
        --     end,
        --     right_sep = " ",
        --     left_sep = " ",
        -- },
        -- {
        --     provider = function()
        --         return ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc):upper()
        --     end,
        --     right_sep = " ",
        --     left_sep = " ",
        -- },
        -- {
        --     provider = function()
        --         local fileformat = ((vim.bo.fileformat ~= "" and vim.bo.fileformat) or vim.o.fileformat)
        --         if fileformat == "unix" then
        --             return "LF"
        --         else
        --             return "CRLF"
        --         end
        --     end,
        --     right_sep = " ",
        --     left_sep = " ",
        -- },
        {
            provider = function()
                local ft = vim.bo.filetype

                if ft == "" then
                    ft = vim.fn.expand("%:e")

                    if ft == "" then
                        local buf = vim.api.nvim_get_current_buf()
                        local bufname = vim.api.nvim_buf_get_name(buf)

                        if bufname == vim.loop.cwd() then
                            return "Directory"
                        end
                    end
                end

                local filetypes = require("config.feline.filetypes")
                if filetypes[ft] == nil then
                    return filetypes[""]
                end
                return filetypes[ft]
            end,
            right_sep = " ",
            left_sep = " ",
        },
    }
    components.inactive[1] = {
        {
            provider = " ",
            hl = { bg = "vi_mode_bg" },
        },
        {
            provider = "file_type",
            hl = { bg = "vi_mode_bg", fg = "vi_mode_fg" },
        },
        {
            provider = " ",
            hl = { bg = "vi_mode_bg" },
            right_sep = { " " },
        },
    }
    components.inactive[2] = {}

    return components
end

return M
