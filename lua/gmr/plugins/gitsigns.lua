return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
        require('gitsigns').setup {
            on_attach = function(bufnr)
                local gitsigns = require 'gitsigns'

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gitsigns.nav_hunk 'next'
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gitsigns.nav_hunk 'prev'
                    end
                end)

                -- Actions
                map('n', '<leader>sh', gitsigns.stage_hunk)
                map('n', '<leader>rh', gitsigns.reset_hunk)
                map('v', '<leader>sh', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end)
                map('v', '<leader>rh', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end)
                map('n', '<leader>ush', gitsigns.undo_stage_hunk)
                map('n', '<leader>ph', gitsigns.preview_hunk)
                map('n', '<leader>td', gitsigns.toggle_deleted)
            end,
        }
    end,
}
