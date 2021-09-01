require("formatter").setup({
    logging = false,
    filetype = {
        go = {
            -- gofmt
            function()
                return {
                    exe = "gofmt",
                    args = { "-w", "." },
                    stdin = false,
                }
            end,
        },
        javascript = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.api.nvim_buf_get_name(0),
                        "--tab-width 4",
                    },
                    stdin = true,
                }
            end,
        },
        lua = {
            -- stylua
            function()
                return {
                    exe = "stylua",
                    args = { "--indent-type Spaces --indent-width 4 --quote-style ForceDouble --line-endings Windows" },
                    stdin = false,
                }
            end,
        },
        python = {
            -- autopep8
            function()
                return {
                    exe = "autopep8",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end,
        },
        rust = {
            -- Rustfmt
            function()
                return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
            end,
        },
        typescript = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.api.nvim_buf_get_name(0),
                        "--tab-width 4",
                    },
                    stdin = true,
                }
            end,
        },
    },
})
