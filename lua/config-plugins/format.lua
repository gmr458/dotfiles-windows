local stylua_format
if vim.fn.has("win32") == 1 then
    stylua_format = "--indent-type Spaces --indent-width 4 --line-endings Windows --quote-style ForceDouble"
else
    stylua_format = "--indent-type Spaces --indent-width 4 --line-endings Unix --quote-style ForceDouble"
end

require("formatter").setup({
    logging = false,
    filetype = {
        go = {
            -- gofmt
            function()
                return { exe = "gofmt", args = { "-w", "." }, stdin = false }
            end,
        },
        html = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        javascript = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        json = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        jsonc = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        lua = {
            -- stylua
            function()
                return { exe = "stylua", args = { stylua_format }, stdin = false }
            end,
        },
        python = {
            -- autopep8
            function()
                return { exe = "autopep8", args = { vim.api.nvim_buf_get_name(0) }, stdin = true }
            end,
        },
        rust = {
            -- rustfmt
            function()
                return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
            end,
        },
        typescript = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
    },
})
