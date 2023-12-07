local M = {}

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

function M.running_wsl()
    if vim.loop.os_uname().sysname == 'Linux' then
        local kernel_release = vim.fn.system { 'uname', '-r' }
        return string.find(kernel_release, 'WSL', 1, true) ~= nil
    end

    return false
end

function M.running_android()
    if vim.loop.os_uname().sysname == 'Linux' then
        local kernel_release = vim.fn.system { 'uname', '-a' }
        return string.find(kernel_release, 'Android', 1, true) ~= nil
    end

    return false
end

function M.is_nil_or_empty_string(s)
    return s == nil or s == ''
end

function M.is_unsaved()
    return vim.api.nvim_get_option_value('mod', { buf = 0 })
end

function M.trim(str)
    str = str:gsub('^%s+', '')
    str = str:gsub('%s+$', '')
    return str
end

return M
