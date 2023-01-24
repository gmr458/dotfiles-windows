local M = {}

M.winbar_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "Jaq",
    "harpoon",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dap-repl",
    "dap-terminal",
    "dapui_console",
    "lab",
    "Markdown",
    "",
}

M.get_filename = function()
    local filename = vim.fn.expand("%:.")
    local extension = vim.fn.expand("%:e")
    local utils = require("config.utils")

    if not utils.is_nil_or_empty_string(filename) then
        local file_icon, file_icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

        local hl_group = "FileIconColor" .. extension

        vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

        if utils.is_nil_or_empty_string(file_icon) then
            file_icon = ""
            file_icon_color = ""
        end

        return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
    end
end

local get_navic = function()
    local navic_loaded, navic = pcall(require, "nvim-navic")

    if not navic_loaded then
        return ""
    end

    local navic_location_loaded, navic_location = pcall(navic.get_location, {})

    if not navic_location_loaded then
        return ""
    end

    if not navic.is_available() or navic_location == "error" then
        return ""
    end

    if not require("config.utils").is_nil_or_empty_string(navic_location) then
        return "" .. " " .. navic_location
    end

    return ""
end

local excludes = function()
    if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt_local.winbar = nil
        return true
    end

    return false
end

M.get_winbar = function()
    if excludes() then
        return
    end

    local utils = require("config.utils")
    local value = M.get_filename()
    local navic_added = false

    if not utils.is_nil_or_empty_string(value) then
        local navic_value = get_navic()
        value = value .. " " .. navic_value

        if not utils.is_nil_or_empty_string(navic_value) then
            navic_added = true
        end
    end

    if not utils.is_nil_or_empty_string(value) and utils.is_unsaved() then
        local mod = "%#LspCodeLens#" .. "" .. "%*"

        if navic_added then
            value = value .. " " .. mod
        else
            value = value .. mod
        end
    end

    local num_tabs = #vim.api.nvim_list_tabpages()

    if num_tabs > 1 and not utils.is_nil_or_empty_string(value) then
        local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
        value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
    end

    local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })

    if not status_ok then
        return
    end
end

M.create_winbar = function()
    vim.api.nvim_create_augroup("_winbar", {})

    if vim.fn.has("nvim-0.8") == 1 then
        vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
            {
                group = "_winbar",
                callback = function()
                    local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
                    if not status_ok then
                        require("config.winbar").get_winbar()
                    end
                end,
            }
        )
    end
end

M.create_winbar()

return M
