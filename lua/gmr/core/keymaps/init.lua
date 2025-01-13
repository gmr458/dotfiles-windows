vim.g.mapleader = ' '

require 'gmr.core.keymaps.colorizer'
require 'gmr.core.keymaps.editor'
require 'gmr.core.keymaps.grapple'
require 'gmr.core.keymaps.nvim-tree'

if vim.fn.has 'win32' == 1 then
    require 'gmr.core.keymaps.telescope'
else
    require 'gmr.core.keymaps.fzf'
end

-- neovim 0.11 use <Tab> and <S-Tab> for snippets, i don't use snippets
if vim.fn.has 'nvim-0.11' == 1 then
    -- Ensure that forced and not configurable `<Tab>` and `<S-Tab>`
    -- buffer-local mappings don't override already present ones
    local expand_orig = vim.snippet.expand
    vim.snippet.expand = function(...)
        local tab_map = vim.fn.maparg('<Tab>', 'i', false, true)
        local stab_map = vim.fn.maparg('<S-Tab>', 'i', false, true)
        expand_orig(...)
        vim.schedule(function()
            tab_map.buffer, stab_map.buffer = 1, 1
            -- Override temporarily forced buffer-local mappings
            vim.fn.mapset('i', false, tab_map)
            vim.fn.mapset('i', false, stab_map)
        end)
    end
end
