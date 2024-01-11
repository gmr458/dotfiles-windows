local M = {}

--- @param type string
--- @return integer
function M.diff(type)
    local gsd = vim.b.gitsigns_status_dict
    if gsd and gsd[type] then
        return gsd[type]
    end

    return 0
end

return M
