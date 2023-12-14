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

dashboard.section.header.val = require('config.headers').Bloody
dashboard.section.header.opts = { position = 'center', hl = 'AlphaHeader' }

dashboard.section.buttons.val = {
    dashboard.button(
        'Space ff',
        '  Find file',
        '<cmd>lua require(\'fzf-lua\').files { winopts = { preview = { hidden = \'hidden\' } } }<cr>'
    ),
    dashboard.button(
        'Space lg',
        '󰈞  Live grep',
        '<cmd>FzfLua live_grep<cr>'
    ),
    dashboard.button(
        'Space of',
        '󰈙  Recent File',
        '<cmd>FzfLua oldfiles<cr>'
    ),
    dashboard.button(
        'Space hh',
        '?  Help',
        '<cmd>lua require(\'fzf-lua\').help_tags { winopts = { preview = { layout = \'horizontal\' } }, prompt = \'   Help ❯ \' }<cr>'
    ),
    -- dashboard.button(
    --     'Space ff',
    --     '  Find file',
    --     '<CMD>silent Telescope find_files no_ignore=false<CR>'
    -- ),
    -- dashboard.button(
    --     'Space lg',
    --     '󰈞  Live grep',
    --     '<CMD>silent Telescope live_grep preview=true<CR>'
    -- ),
    -- dashboard.button(
    --     'Space of',
    --     '󰈙  Recent File',
    --     '<CMD>silent Telescope oldfiles preview=false<CR>'
    -- ),
    -- dashboard.button(
    --     'Space ht',
    --     '?  Help',
    --     '<CMD>silent Telescope help_tags preview=true<CR>'
    -- ),
    dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

for _, value in pairs(dashboard.section.buttons.val) do
    value.opts.hl_shortcut = 'AlphaShorcut'
    value.opts.hl = 'AlphaButton'
end

alpha.setup(dashboard.config)
