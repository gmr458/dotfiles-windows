local M = {}

--- @param filename string
--- @param text string
function M.write_file(filename, text)
    local file = io.open(filename, 'w+')
    if file == nil or io.type(file) ~= 'file' then
        print('Failed to open output file', filename)
        return
    end
    file:setvbuf 'full'

    file:write(text)
    file:flush()
    file:close()
end

--- @return boolean
function M.running_wsl()
    local release = vim.uv.os_uname().release
    return string.find(release, 'WSL', 1, true) ~= nil
end

--- @return boolean
function M.running_android()
    local machine = vim.uv.os_uname().machine
    return string.find(machine, 'arm', 1, true) ~= nil
end

--- @return boolean
function M.is_nil_or_empty_string(s)
    return s == nil or s == ''
end

--- @return boolean
function M.is_unsaved()
    return vim.api.nvim_get_option_value('mod', { buf = 0 })
end

--- @return string
function M.trim(str)
    str = str:gsub('^%s+', '')
    str = str:gsub('%s+$', '')
    return str
end

--- @return boolean
function M.pumvisible()
    return tonumber(vim.fn.pumvisible()) ~= 0
end

return M
