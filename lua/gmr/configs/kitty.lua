local M = {}

local direction = {
    ['h'] = 'left',
    ['j'] = 'bottom',
    ['k'] = 'top',
    ['l'] = 'right',
}

--- @param hjkl 'h'|'j'|'k'|'l'
function M.nav(hjkl)
    local current_winnr = vim.fn.winnr()
    vim.api.nvim_command('wincmd ' .. hjkl)
    local new_winnr = vim.fn.winnr()

    if current_winnr == new_winnr then
        local cmd = 'kitten @ focus-window --match neighbor:' .. direction[hjkl]
        vim.fn.system(cmd)
    end
end

return M
