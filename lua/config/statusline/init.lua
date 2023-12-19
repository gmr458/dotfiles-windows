local statusline_augroup =
    vim.api.nvim_create_augroup('StatusLine', { clear = true })

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local modes = require 'config.statusline.modes'
    local mode_str = string.format(' %s', modes[current_mode]):upper()
    return mode_str
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
        if client.name == 'pyright' then
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
        return string.format(' %s', table.concat(unique_client_names, ' '))
    end

    return ''
end

local function get_diagnostics_count(severity)
    return vim.tbl_count(
        vim.diagnostic.get(0, severity and { severity = severity })
    )
end

local function diagnostics_error()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.ERROR)
    if count > 0 then
        local errors_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspError#' .. errors_count .. '%*'
    end

    return ''
end

local function diagnostics_warns()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.WARN)
    if count > 0 then
        local warns_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspWarn#' .. warns_count .. '%*'
    end

    return ''
end

local function diagnostics_hint()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.HINT)
    if count > 0 then
        local hints_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspHint#' .. hints_count .. '%*'
    end

    return ''
end

local function diagnostics_info()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.INFO)
    if count > 0 then
        local infos_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspInfo#' .. infos_count .. '%*'
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
    pattern = { 'begin', 'end' },
    callback = function(args)
        if not args.data then
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

    return '%#StatusLineLspMessages#' .. lsp_message .. '%*'
end

local function git_diff(type)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ''
end

local function git_diff_added()
    local diff = git_diff 'added'
    if diff == '' then
        return ''
    end

    local added = string.format(' +%s', diff)
    return '%#StatusLineGitDiffAdded#' .. added .. '%*'
end

local function git_diff_changed()
    local diff = git_diff 'changed'
    if diff == '' then
        return ''
    end

    local changed = string.format(' ~%s', diff)
    return '%#StatusLineGitDiffChanged#' .. changed .. '%*'
end

local function git_diff_removed()
    local diff = git_diff 'removed'
    if diff == '' then
        return ''
    end

    local removed = string.format(' -%s', diff)
    return '%#StatusLineGitDiffRemoved#' .. removed .. '%*'
end

local function git_branch()
    if vim.b.gitsigns_head == '' or vim.b.gitsigns_head == nil then
        return ''
    end

    return ' %#StatusLineGitBranchIcon#󰘬%* ' .. vim.b.gitsigns_head
end

local function file_percentage()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)

    return string.format(' %d%%%%', math.ceil(current_line / lines * 100))
end

local function total_lines()
    local lines = vim.fn.line '$'
    local visible_lines = vim.fn.line 'w$'

    if lines <= visible_lines then
        return ''
    end

    return string.format('  %s', lines)
end

local function formatted_filetype()
    local filetype = vim.bo.filetype or vim.fn.expand('%:e', false)

    if filetype == '' then
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)

        if bufname == vim.uv.cwd() then
            return ' Directory '
        end
    end

    local filetypes = require 'config.statusline.filetypes'

    if filetypes[filetype] == nil then
        return string.format(' %s ', filetypes[''])
    end
    return string.format(' %s ', filetypes[filetype])
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
            '%#Statusline#',
            mode(),
            '%=',
            '%=',
        }
    end

    return table.concat {
        '%#Statusline#',
        mode(),
        python_env(),
        lsp_clients(),
        diagnostics_error(),
        diagnostics_warns(),
        diagnostics_hint(),
        diagnostics_info(),
        lsp_status(),
        '%=',
        '%=',
        git_diff_added(),
        git_diff_changed(),
        git_diff_removed(),
        git_branch(),
        file_percentage(),
        total_lines(),
        formatted_filetype(),
    }
end

StatusLine.inactive = function()
    return table.concat {
        '%#Statusline#',
        -- '%#StatusLineMode#',
        formatted_filetype():upper(),
        -- '%*',
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
    'qf',
    'TelescopePrompt',
    'fzf',
    'lspinfo',
    'lazy',
}

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'FileType' }, {
    group = statusline_augroup,
    pattern = inactive_filetypes,
    command = 'setlocal statusline=%!v:lua.StatusLine.inactive()',
})
