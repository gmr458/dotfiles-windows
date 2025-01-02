return {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',
    config = function()
        require('blink-cmp').setup {
            keymap = {
                ['<C-space>'] = {
                    'show',
                    'show_documentation',
                    'hide_documentation',
                },
                ['<C-e>'] = { 'hide' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            completion = {
                list = {
                    selection = 'auto_insert',
                },
                menu = {
                    border = 'single',
                    auto_show = false,
                    draw = {
                        treesitter = { 'lsp' },
                        columns = {
                            {
                                'label',
                                gap = 1,
                            },
                            { 'kind' },
                        },
                    },
                },
                documentation = {
                    window = { border = 'single' },
                    auto_show = true,
                },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
            },
            sources = {
                default = { 'lsp', 'path', 'buffer' },
                cmdline = {},
            },
        }
    end,
}
