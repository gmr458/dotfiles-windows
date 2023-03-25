local formatter_loaded, formatter = pcall(require, "formatter")

if not formatter_loaded then
    print("formatter not loaded")
    return
end

local prettier_config_2_spaces = function()
    return {
        exe = "prettier",
        args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
        stdin = true,
    }
end

local prettier_config_4_spaces = function()
    return {
        exe = "prettier",
        args = { "--tab-width", "4", "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
        stdin = true,
    }
end

local prettier_config = function()
    local spaces = vim.bo.tabstop

    return {
        exe = "prettier",
        args = { "--tab-width", spaces, "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
        stdin = true,
    }
end

formatter.setup({
    logging = false,
    filetype = {
        css = { prettier_config },
        go = {
            function()
                return { exe = "gofmt", args = { "-w" }, stdin = false }
            end,
        },
        html = { prettier_config },
        htmldjango = {
            function()
                return {
                    exe = "djlint",
                    args = { "--reformat", "--preserve-leading-space", "--preserve-blank-lines", "--indent", "2" },
                }
            end,
        },
        javascript = { prettier_config },
        javascriptreact = { prettier_config },
        json = { prettier_config },
        jsonc = { prettier_config },
        lua = {
            function()
                return { exe = "stylua", stdin = false }
            end,
        },
        python = {
            function()
                return { exe = "black", stdin = false }
            end,
        },
        rust = {
            function()
                return { exe = "rustfmt", stdin = false, args = { "--edition", "2021" } }
            end,
        },
        scss = { prettier_config },
        typescript = { prettier_config },
        typescriptreact = { prettier_config },
    },
})
