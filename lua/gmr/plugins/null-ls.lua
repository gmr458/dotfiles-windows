return {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local null_ls = require 'null-ls'

        null_ls.setup {
            sources = {
                null_ls.builtins.diagnostics.djlint.with {
                    diagnostic_config = {
                        underline = false,
                        virtual_text = false,
                        signs = false,
                    },
                    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                },
            },
        }
    end,
}
