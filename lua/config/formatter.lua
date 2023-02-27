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

formatter.setup({
    logging = false,
    filetype = {
        css = { prettier_config_2_spaces },
        go = {
            function()
                return { exe = "gofmt", args = { "-w" }, stdin = false }
            end,
        },
        html = { prettier_config_2_spaces },
        htmldjango = {
            function()
                return {
                    exe = "djlint",
                    args = { "--reformat", "--preserve-leading-space", "--preserve-blank-lines", "--indent", "2" },
                }
            end,
        },
        javascript = { prettier_config_4_spaces },
        javascriptreact = { prettier_config_2_spaces },
        json = { prettier_config_2_spaces },
        jsonc = { prettier_config_2_spaces },
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
        scss = { prettier_config_2_spaces },
        typescript = { prettier_config_4_spaces },
        typescriptreact = { prettier_config_2_spaces },
    },
})
