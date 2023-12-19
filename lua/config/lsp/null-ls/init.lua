local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    vim.notify 'null-ls could not be loaded'
    return
end

null_ls.setup {
    sources = {
        ---- Code Actions -------------------------

        -- Go
        -- null_ls.builtins.code_actions.gomodifytags,
        -- null_ls.builtins.code_actions.impl,

        -- JavaScript / TypeScript
        null_ls.builtins.code_actions.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file {
                    '.eslintrc.js',
                    '.eslintrc.cjs',
                    '.eslintrc.yaml',
                    '.eslintrc.yml',
                    '.eslintrc.json',
                }
            end,
        },

        ---- Diagnostics --------------------------

        -- HTML Django / Jinja
        null_ls.builtins.diagnostics.djlint.with {
            diagnostic_config = {
                underline = false,
                virtual_text = false,
                signs = false,
            },
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        },

        -- JavaScript / TypeScript
        null_ls.builtins.diagnostics.eslint_d.with {
            condition = function(utils)
                return utils.root_has_file {
                    '.eslintrc.js',
                    '.eslintrc.cjs',
                    '.eslintrc.yaml',
                    '.eslintrc.yml',
                    '.eslintrc.json',
                }
            end,
        },
        null_ls.builtins.diagnostics.deno_lint.with {
            condition = function(utils)
                return utils.root_has_file {
                    'deno.json',
                    'deno.jsonc',
                }
            end,
        },

        -- Python
        null_ls.builtins.diagnostics.ruff,

        -- Go
        null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.diagnostics.staticcheck,

        -- Lua
        -- null_ls.builtins.diagnostics.luacheck,
    },
}
