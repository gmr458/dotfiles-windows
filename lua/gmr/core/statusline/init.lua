local statusline_augroup =
    vim.api.nvim_create_augroup('gmr_statusline', { clear = true })

local lsp = require 'gmr.core.statusline.lsp'
local git = require 'gmr.core.statusline.git'

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local modes = require 'gmr.core.statusline.modes'

    return string.format(
        '%%#StatusLineMode# %%*%%#StatusLineNeovimLogo#%%*%%#StatusLineMode# %s %%*',
        modes[current_mode]:upper()
    )
end

local function python_env()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local buf = vim.api.nvim_get_current_buf()
    local buf_clients = vim.lsp.get_clients { bufnr = buf }
    if next(buf_clients) == nil then
        return ''
    end

    for _, client in pairs(buf_clients) do
        if client.name == 'pyright' or client.name == 'pylance' then
            local virtual_env = os.getenv 'VIRTUAL_ENV_PROMPT'
            if virtual_env == nil then
                return ''
            end

            virtual_env = virtual_env:gsub('%s+', '')
            return string.format(' %s', virtual_env)
        end
    end

    return ''
end

local function lsp_active()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local current_buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients { bufnr = current_buf }

    local space = '%#StatusLineMedium# %*'

    if #clients > 0 then
        return space
            .. '%#StatusLineLspActive#%*'
            .. space
            .. '%#StatusLineMedium#LSP%*'
    end

    return ''
end

local function lsp_clients()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local current_buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients { bufnr = current_buf }
    if next(clients) == nil then
        return ''
    end

    local null_ls_running = false

    local client_names = {}
    for _, client in pairs(clients) do
        if client.name ~= 'null-ls' then
            table.insert(client_names, client.name)
        else
            null_ls_running = true
        end
    end

    if null_ls_running then
        local ok, sources = pcall(require, 'null-ls.sources')
        if not ok then
            return ''
        end

        local available_sources = sources.get_available(vim.bo.filetype)

        for _, source in ipairs(available_sources) do
            table.insert(client_names, source.name)
        end
    end

    local unique_client_names = vim.fn.uniq(client_names)
    if type(unique_client_names) == 'table' then
        return string.format(' 󰒋 %s', table.concat(unique_client_names, ' '))
    end

    return ''
end

local function diagnostics_error()
    local count = lsp.get_diagnostics_count(vim.diagnostic.severity.ERROR)
    if count > 0 then
        return string.format('%%#StatusLineLspError#  %s%%*', count)
    end

    return ''
end

local function diagnostics_warns()
    local count = lsp.get_diagnostics_count(vim.diagnostic.severity.WARN)
    if count > 0 then
        return string.format('%%#StatusLineLspWarn#  %s%%*', count)
    end

    return ''
end

local function diagnostics_hint()
    local count = lsp.get_diagnostics_count(vim.diagnostic.severity.HINT)
    if count > 0 then
        return string.format('%%#StatusLineLspHint#  %s%%*', count)
    end

    return ''
end

local function diagnostics_info()
    local count = lsp.get_diagnostics_count(vim.diagnostic.severity.INFO)
    if count > 0 then
        return string.format('%%#StatusLineLspInfo#  %s%%*', count)
    end

    return ''
end

--- @class LspProgress
--- @field client lsp.Client?
--- @field kind string?
--- @field title string?
--- @field percentage integer?
--- @field message string?
local lsp_progress = {
    client = nil,
    kind = nil,
    title = nil,
    percentage = nil,
    message = nil,
}

vim.api.nvim_create_autocmd('LspProgress', {
    group = statusline_augroup,
    desc = 'Update LSP progress in statusline',
    pattern = { 'begin', 'report', 'end' },
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        lsp_progress = {
            client = vim.lsp.get_client_by_id(args.data.client_id),
            kind = args.data.result.value.kind,
            message = args.data.result.value.message,
            percentage = args.data.result.value.percentage,
            title = args.data.result.value.title,
        }

        if lsp_progress.kind == 'end' then
            lsp_progress.title = nil
            vim.defer_fn(function()
                vim.cmd.redrawstatus()
            end, 500)
        else
            vim.cmd.redrawstatus()
        end
    end,
})

local function lsp_status()
    if not rawget(vim, 'lsp') then
        return ''
    end

    if vim.o.columns < 120 then
        return ''
    end

    if not lsp_progress.client or not lsp_progress.title then
        return ''
    end

    local title = lsp_progress.title or ''
    local percentage = (
        lsp_progress.percentage and (lsp_progress.percentage .. '%%')
    ) or ''
    local message = lsp_progress.message or ''

    local lsp_message = string.format(' %s', title)

    if message ~= '' then
        lsp_message = string.format('%s %s', lsp_message, message)
    end

    if percentage ~= '' then
        lsp_message = string.format('%s %s', lsp_message, percentage)
    end

    return string.format('%%#StatusLineLspMessages#%s%%* ', lsp_message)
end

local function relative_path()
    local path = vim.fn.expand '%:.'
    local extension = vim.fn.expand '%:e'

    local ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
    if ok then
        local icon, color = nvim_web_devicons.get_icon_color(
            path,
            extension,
            { default = true, strict = true }
        )

        local bg = vim.api.nvim_get_hl(0, { name = 'StatusLine' }).bg
        local hl_group = string.format('FileIconColor%s', extension)
        vim.api.nvim_set_hl(0, hl_group, { fg = color, bg = bg })

        return string.format(' %%#%s#%s%%* %s', hl_group, icon, path)
    end

    return string.format(' %s', path)
end

local function unsaved()
    if vim.api.nvim_get_option_value('mod', { buf = 0 }) then
        return '%#StatusLineUnsavedFileIcon#*%*'
    end

    return ''
end

local function readonly()
    if vim.bo.readonly then
        return ' '
    end

    return ''
end

local function git_diff_added()
    local added = git.diff 'added'
    if added > 0 then
        return string.format('%%#StatusLineGitDiffAdded#+%s%%*', added)
    end

    return ''
end

local function git_diff_changed()
    local changed = git.diff 'changed'
    if changed > 0 then
        return string.format('%%#StatusLineGitDiffChanged#~%s%%*', changed)
    end

    return ''
end

local function git_diff_removed()
    local removed = git.diff 'removed'
    if removed > 0 then
        return string.format('%%#StatusLineGitDiffRemoved#-%s%%*', removed)
    end

    return ''
end

local function git_branch_icon()
    return '%#StatusLineGitBranchIcon#%*'
end

local function git_branch()
    local branch = vim.b.gitsigns_head

    if branch == '' or branch == nil then
        return ''
    end

    return string.format('%%#StatusLineMedium#%s%%*', branch)
end

local function full_git()
    local full = ''
    local space = '%#StatusLineMedium# %*'

    local branch = git_branch()
    if branch ~= '' then
        local icon = git_branch_icon()
        full = full .. space .. icon .. space .. branch .. space
    end

    local added = git_diff_added()
    if added ~= '' then
        full = full .. added .. space
    end

    local changed = git_diff_changed()
    if changed ~= '' then
        full = full .. changed .. space
    end

    local removed = git_diff_removed()
    if removed ~= '' then
        full = full .. removed .. space
    end

    return full
end

local function file_percentage()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)

    return string.format('%d%%%%', math.ceil(current_line / lines * 100))
end

local function total_lines()
    local lines = vim.fn.line '$'
    local visible_lines = vim.fn.line 'w$'

    if lines <= visible_lines then
        return ''
    end

    return string.format('  %s', lines)
end

local function get_icon()
    local ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
    if not ok then
        return ''
    end

    local path = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.expand '%:e'

    local icon, color = nvim_web_devicons.get_icon_color(
        path,
        extension,
        { default = true, strict = false }
    )

    local bg = vim.api.nvim_get_hl(0, { name = 'StatusLineMedium' }).bg
    if bg == nil then
        bg = vim.api.nvim_get_hl(0, { name = 'StatusLine' }).bg
    end

    local hl_group = string.format('FileIconColor%s', extension)
    vim.api.nvim_set_hl(0, hl_group, { fg = color, bg = bg })

    return string.format('%%#%s#%s%%*', hl_group, icon)
end

--- @param with_icon boolean
--- @param hlgroup string
local function formatted_filetype(with_icon, hlgroup)
    local filetype = vim.bo.filetype or vim.fn.expand('%:e', false)

    if filetype == '' then
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)

        if bufname == vim.uv.cwd() then
            return string.format('%%#%s#  Directory %%*', hlgroup)
        end
    end

    local filetypes = require 'gmr.core.statusline.filetypes'

    if with_icon then
        local space = string.format('%%#%s# %%*', hlgroup)
        local icon = get_icon()
        local ft = string.format('%%#%s#%s%%*', hlgroup, filetypes[filetype])

        return string.format('%s%s%s%s%s', space, icon, space, ft, space)
    end

    -- return string.format('%%#StatusLineMedium# %s %%*', filetypes[filetype])
    return string.format('%%#%s# %s %%*', hlgroup, filetypes[filetype])
end

StatusLine = {}

StatusLine.active = function()
    if vim.o.filetype == 'alpha' then
        return table.concat {
            '%#Normal#',
        }
    end

    local mode_str = vim.api.nvim_get_mode()['mode']
    if mode_str == 't' or mode_str == 'nt' then
        return table.concat {
            mode(),
            '%=',
            '%=',
        }
    end

    return table.concat {
        mode(),
        -- relative_path(),
        -- unsaved(),
        -- readonly(),
        full_git(),
        '%=',
        '%=',
        lsp_status(),
        diagnostics_error(),
        diagnostics_warns(),
        diagnostics_hint(),
        diagnostics_info(),
        -- lsp_clients(),
        python_env(),
        -- file_percentage(),
        -- total_lines(),
        lsp_active(),
        formatted_filetype(true, 'StatusLineMedium'),
    }
end

StatusLine.inactive = function()
    return table.concat {
        formatted_filetype(false, 'StatusLineMode'),
    }
end

StatusLine.empty = function()
    return table.concat {
        '%#Normal#',
    }
end

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    group = statusline_augroup,
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.StatusLine.active()',
})

local inactive_filetypes = {
    'NvimTree_1',
    'NvimTree',
    'qf',
    'TelescopePrompt',
    'fzf',
    'lspinfo',
    'lazy',
    'netrw',
    'mason',
    'help',
    'noice',
}

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'FileType' }, {
    group = statusline_augroup,
    pattern = inactive_filetypes,
    command = 'setlocal statusline=%!v:lua.StatusLine.inactive()',
})
