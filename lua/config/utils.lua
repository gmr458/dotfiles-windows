local M = {}

M.write_file = function(filename, text)
    local file = io.open(filename, "w+")
    if file == nil or io.type(file) ~= "file" then
        print("Failed to open output file", filename)
        return
    end
    file:setvbuf("full")

    file:write(text)
    file:flush()
    file:close()
end

M.running_wsl = function()
    if vim.loop.os_uname().sysname == "Linux" then
        local kernel_release = vim.fn.system({ "uname", "-r" })
        return string.find(kernel_release, "WSL", 1, true) ~= nil
    end

    return false
end

M.running_android = function()
    if vim.loop.os_uname().sysname == "Linux" then
        local kernel_release = vim.fn.system({ "uname", "-a" })
        return string.find(kernel_release, "Android", 1, true) ~= nil
    end

    return false
end

M.is_nil_or_empty_string = function(s)
    return s == nil or s == ""
end

function M.is_unsaved()
    local status_ok, is_unsaved = pcall(vim.api.nvim_buf_get_option, 0, "mod")

    if not status_ok then
        return nil
    end

    return is_unsaved
end

M.filetypes_simple_use = {
    "asm",
    "c",
    "cmd",
    "conf",
    "cpp",
    "cs",
    "css",
    "diff",
    "django-html",
    "dockerfile",
    "dosini",
    "go",
    "gomod",
    "hercules",
    "html",
    "htmldjango",
    "java",
    "javascript",
    "javascriptreact",
    "jproperties",
    "json",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "php",
    "proto",
    "python",
    "rasi",
    "ruby",
    "rust",
    "sh",
    "sql",
    "tmux",
    "toml",
    "txt",
    "typescript",
    "typescriptreact",
    "vim",
    "xml",
    "yaml",
    "zsh",
}

return M
