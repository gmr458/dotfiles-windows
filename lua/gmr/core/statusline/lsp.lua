local M = {}

--- @param severity integer
--- @return integer
function M.get_diagnostics_count(severity)
    if not rawget(vim, 'lsp') then
        return 0
    end

    local count = vim.diagnostic.count(0, { serverity = severity })[severity]
    if count == nil then
        return 0
    end

    return count
end

return M
