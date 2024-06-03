--- @param height number|nil
--- @param width number|nil
local function get_fzf_opts(height, width)
    height = height or 0.85
    width = width or 0.80

    return {
        winopts = {
            height = height,
            width = width,
            preview = {
                hidden = 'hidden',
            },
        },
        fzf_opts = {
            ['--highlight-line'] = true,
        },
    }
end

vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files(get_fzf_opts(0.7, 0.5))
end, {
    silent = true,
    desc = 'FzfLua Find Files',
})

vim.keymap.set('n', '<leader>gs', function()
    require('fzf-lua').git_status {
        winopts = {
            fullscreen = true,
        },
    }
end, {
    silent = true,
    desc = 'FzfLua Git Status',
})

vim.keymap.set('n', '<leader>lg', function()
    require('fzf-lua').live_grep {
        winopts = {
            fullscreen = true,
        },
    }
end, {
    silent = true,
    desc = 'FzfLua Live Grep',
})

vim.keymap.set('n', '<leader>hh', function()
    require('fzf-lua').help_tags {
        winopts = {
            preview = {
                layout = 'horizontal',
            },
            fullscreen = true,
        },
        resume = true,
    }
end, {
    silent = true,
    desc = 'FzfLua Help Tags',
})

vim.keymap.set('n', '<leader>of', function()
    require('fzf-lua').oldfiles(get_fzf_opts())
end, {
    silent = true,
    desc = 'FzfLua History Files',
})

vim.keymap.set('n', '<leader>bf', function()
    require('fzf-lua').buffers(get_fzf_opts(0.7, 0.5))
end, {
    silent = true,
    desc = 'Fzf Buffer Opened',
})
