local ok, alpha, dashboard

ok, alpha = pcall(require, 'alpha')
if not ok then
    vim.notify 'alpha could not be loaded'
    return
end

ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok then
    vim.notify 'alpha.themes.dashboard could not be loaded'
    return
end

require 'alpha.term'

dashboard.section.terminal.command = vim.fn.stdpath 'config' .. '/logo.sh'
dashboard.section.terminal.width = 30
dashboard.section.terminal.height = 18
dashboard.section.terminal.opts.position = 'center'
dashboard.section.terminal.opts.redraw = true

-- dashboard.section.header.val = require('config.headers').Logo
-- dashboard.section.header.opts = { position = 'center', hl = 'AlphaHeader' }

dashboard.section.buttons.val = {
    -- dashboard.button(
    --     'Space ff',
    --     '  Find file',
    --     '<cmd>lua require(\'fzf-lua\').files { winopts = { preview = { hidden = \'hidden\' } } }<cr>'
    -- ),
    -- dashboard.button(
    --     'Space lg',
    --     '󰈞  Live grep',
    --     '<cmd>FzfLua live_grep<cr>'
    -- ),
    -- dashboard.button(
    --     'Space of',
    --     '󰈙  Recent File',
    --     '<cmd>FzfLua oldfiles<cr>'
    -- ),
    -- dashboard.button(
    --     'Space hh',
    --     '?  Help',
    --     '<cmd>lua require(\'fzf-lua\').help_tags { winopts = { preview = { layout = \'horizontal\' } }, prompt = \'   Help ❯ \' }<cr>'
    -- ),
    dashboard.button(
        'Space ff',
        '  Find file',
        '<CMD>silent Telescope find_files no_ignore=false<CR>'
    ),
    dashboard.button(
        'Space lg',
        '󰈞  Live grep',
        '<CMD>silent Telescope live_grep preview=true<CR>'
    ),
    dashboard.button(
        'Space of',
        '󰈙  Recent File',
        '<CMD>silent Telescope oldfiles preview=false<CR>'
    ),
    dashboard.button(
        'Space ht',
        '?  Help',
        '<CMD>silent Telescope help_tags preview=true<CR>'
    ),
    dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

for _, value in pairs(dashboard.section.buttons.val) do
    value.opts.hl_shortcut = 'AlphaShorcut'
    value.opts.hl = 'AlphaButton'
end

dashboard.opts.layout = {
    { type = 'padding', val = 2 },
    vim.o.lines > 30 and dashboard.section.terminal or nil,
    { type = 'padding', val = 4 },
    dashboard.section.buttons,
}

alpha.setup(dashboard.config)
