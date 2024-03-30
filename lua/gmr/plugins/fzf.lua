return {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    config = function()
        local delta_syntax_theme = {
            ['dark'] = 'Dracula',
            ['light'] = 'GitHub',
        }

        local preview_pager = string.format(
            'delta --syntax-theme %s --%s --line-numbers --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=\'omit\' --file-style=\'omit\'',
            delta_syntax_theme[vim.o.background],
            vim.o.background
        )

        local actions = require 'fzf-lua.actions'

        require('fzf-lua').setup {
            winopts = {
                border = 'single',
                row = 0.40,
                col = 0.49,
                preview = {
                    vertical = 'down:65%',
                    horizontal = 'right:60%',
                    layout = 'vertical',
                },
                on_create = function()
                    vim.keymap.set(
                        't',
                        '<tab>',
                        '<down>',
                        { silent = true, buffer = true }
                    )
                    vim.keymap.set(
                        't',
                        '<S-tab>',
                        '<up>',
                        { silent = true, buffer = true }
                    )
                end,
            },
            keymap = {
                builtin = {
                    ['<C-y>'] = 'toggle-preview',
                    ['<C-d>'] = 'preview-page-down',
                    ['<C-u>'] = 'preview-page-up',
                },
                fzf = {
                    ['tab'] = 'toggle-down',
                    ['shift-tab'] = 'toggle-up',
                    ['ctrl-d'] = 'preview-page-down',
                    ['ctrl-u'] = 'preview-page-up',
                },
            },
            actions = {
                files = {
                    ['default'] = actions.file_edit,
                    ['ctrl-x'] = actions.file_split,
                    ['ctrl-v'] = actions.file_vsplit,
                },
            },
            fzf_opts = {
                ['--color'] = vim.o.background .. ',bg+:-1',
                ['--scrollbar'] = '█',
                ['--info'] = 'right',
                ['--no-bold'] = '',
            },
            files = {
                git_icons = false,
                cwd_prompt = false,
                fzf_opts = {
                    ['--info'] = 'right',
                },
            },
            git = {
                status = {
                    preview_pager = preview_pager,
                },
            },
            grep = {
                git_icons = false,
                fzf_opts = {
                    ['--info'] = 'right',
                },
            },
            lsp = {
                symbols = {
                    fzf_opts = {
                        ['--info'] = 'right',
                    },
                    symbol_icons = {
                        File = ' ',
                        Module = ' ',
                        Namespace = ' ',
                        Package = ' ',
                        Class = ' ',
                        Method = ' ',
                        Property = ' ',
                        Field = ' ',
                        Constructor = ' ',
                        Enum = ' ',
                        Interface = ' ',
                        Function = ' ',
                        Variable = ' ',
                        Constant = ' ',
                        String = ' ',
                        Number = ' ',
                        Boolean = ' ',
                        Array = ' ',
                        Object = ' ',
                        Key = ' ',
                        Null = 'null ',
                        EnumMember = ' ',
                        Struct = ' ',
                        Event = ' ',
                        Operator = ' ',
                        TypeParameter = ' ',
                    },
                },
                code_actions = {
                    previewer = 'codeaction_native',
                    preview_pager = preview_pager,
                },
            },
        }
    end,
}
