return {
    'mhartington/formatter.nvim',
    cmd = 'Format',
    config = function()
        local prettier = require 'gmr.configs.formatter.prettier'
        local web = require 'gmr.configs.formatter.web'

        require('formatter').setup {
            logging = false,
            filetype = {
                cs = { require('formatter.filetypes.cs').csharpier },
                css = { prettier },
                dart = { require('formatter.filetypes.dart').dartformat },
                go = { require('formatter.filetypes.go').gofumpt },
                html = { prettier },
                htmldjango = {
                    function()
                        return {
                            exe = 'djlint',
                            args = {
                                '--reformat',
                                '--preserve-leading-space',
                                '--preserve-blank-lines',
                                '--indent',
                                vim.bo.tabstop,
                            },
                        }
                    end,
                },
                javascript = { web },
                javascriptreact = { web },
                json = { prettier },
                jsonc = { prettier },
                lua = require('formatter.filetypes.lua').stylua,
                ocaml = {
                    function()
                        return {
                            exe = 'ocamlformat',
                            args = {
                                '--enable-outside-detected-project',
                                '--break-cases=toplevel',
                                '--if-then-else=fit-or-vertical',
                                vim.fn.shellescape(
                                    vim.api.nvim_buf_get_name(0)
                                ),
                            },
                            stdin = true,
                        }
                    end,
                },
                python = require('formatter.filetypes.python').ruff,
                rust = require('formatter.filetypes.rust').rustfmt,
                scss = { prettier },
                svelte = { prettier },
                toml = require('formatter.filetypes.toml').taplo,
                typescript = { web },
                typescriptreact = { web },
            },
        }
    end,
}
