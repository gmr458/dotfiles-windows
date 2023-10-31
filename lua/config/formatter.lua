local ok, formatter = pcall(require, "formatter")
if not ok then
    vim.notify("formatter could not be loaded")
    return
end

local prettier_config = function()
    local prettier_config_files = {
        ".prettierrc",
        "prettier.config.js",
        "prettier.config.cjs",
    }

    local config_file_exists = false

    for _, config_file in pairs(prettier_config_files) do
        local file = io.open(config_file, "r")
        if file == nil or io.type(file) ~= "file" then
            config_file_exists = false
        else
            file:close()
            config_file_exists = true
            break
        end
    end

    if not config_file_exists then
        return {
            exe = "prettier",
            args = {
                "--tab-width",
                vim.bo.tabstop,
                "--stdin-filepath",
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    return {
        exe = "prettier",
        args = {
            "--stdin-filepath",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
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
                    args = {
                        "--reformat",
                        "--preserve-leading-space",
                        "--preserve-blank-lines",
                        "--indent",
                        "2",
                    },
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
                return { exe = "ruff", args = { "format" }, stdin = false }
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
