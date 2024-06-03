local enable_navic = true

local winbar_filetype_exclude = {
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'DressingSelect',
    'Jaq',
    'harpoon',
    'lab',
    'Markdown',
    'fzf',
    'dap-float',
    'dap-repl',
    '',
}

local function get_filename()
    local filename = vim.fn.expand '%:.'
    local extension = vim.fn.expand '%:e'
    local utils = require 'gmr.core.utils'

    if not utils.is_nil_or_empty_string(filename) then
        local ok, web_devicons = pcall(require, 'nvim-web-devicons')
        if not ok then
            vim.notify 'nvim-web-devicons could not be loaded'
            return
        end

        local file_icon, file_icon_color =
            web_devicons.get_icon_color(filename, extension, { default = true })

        local hl_group = 'WinBarFileIcon' .. extension
        vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

        local readonly = ''
        if vim.bo.readonly then
            readonly = ' '
        end

        local tagged = ''
        if require('grapple').exists() then
            tagged = ' 󰓹'
        end

        return string.format(
            ' %%#%s#%s%%*%%#WarningMsg#%s%s%%* %%#WinBar#%s%%*',
            hl_group,
            file_icon,
            readonly,
            tagged,
            filename
        )
    end
end

local get_navic = function()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local ok, navic = pcall(require, 'nvim-navic')
    if not ok then
        return ''
    end

    local navic_location_loaded, navic_location = pcall(navic.get_location, {})

    if not navic_location_loaded then
        return ''
    end

    if not navic.is_available() or navic_location == 'error' then
        return ''
    end

    if not require('gmr.core.utils').is_nil_or_empty_string(navic_location) then
        return '' .. ' ' .. navic_location
    end

    return ''
end

local function excludes()
    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt_local.winbar = nil
        return true
    end

    return false
end

local function get_winbar()
    if excludes() then
        return
    end

    local utils = require 'gmr.core.utils'
    local value = get_filename()

    if not utils.is_nil_or_empty_string(value) and utils.is_unsaved() then
        local mod = '%#WarningMsg#*%*'
        value = value .. mod
    end

    if enable_navic and not utils.is_nil_or_empty_string(value) then
        local navic_value = get_navic()
        value = value .. ' ' .. navic_value
    end

    local num_tabs = #vim.api.nvim_list_tabpages()

    if num_tabs > 1 and not utils.is_nil_or_empty_string(value) then
        local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
        value = value .. '%=' .. tabpage_number .. '/' .. tostring(num_tabs)
    end

    local status_ok, _ = pcall(
        vim.api.nvim_set_option_value,
        'winbar',
        value,
        { scope = 'local' }
    )

    if not status_ok then
        return
    end
end

vim.api.nvim_create_autocmd({
    'CursorMoved',
    'CursorHold',
    'BufWinEnter',
    'BufFilePost',
    'InsertEnter',
    'BufWritePost',
    'TabClosed',
}, {
    group = vim.api.nvim_create_augroup('gmr_winbar', { clear = true }),
    callback = function()
        local status_ok, _ =
            pcall(vim.api.nvim_buf_get_var, 0, 'lsp_floating_window')
        if not status_ok then
            get_winbar()
        end
    end,
})
