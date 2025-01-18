return {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    config = function()
        local delta_syntax_theme = {
            ['dark'] = 'Dracula',
            ['light'] = 'GitHub',
        }

        local preview_pager = table.concat({
            'delta',
            '--syntax-theme',
            delta_syntax_theme[vim.o.background],
            '--line-numbers',
            -- '--side-by-side',
            '--hunk-header-style=\'omit\'',
            '--file-style=\'omit\'',
        }, ' ')

        local actions = require 'fzf-lua.actions'

        require('fzf-lua').setup {
            winopts = {
                border = 'single',
                row = 0.40,
                col = 0.49,
                backdrop = 100,
                preview = {
                    vertical = 'down:75%',
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
                    ['ctrl-q'] = 'select-all+accept',
                },
            },
            actions = {
                files = {
                    ['enter'] = actions.file_edit_or_qf,
                    ['alt-q'] = actions.file_sel_to_qf,
                    ['ctrl-x'] = actions.file_split,
                    ['ctrl-v'] = actions.file_vsplit,
                },
            },
            fzf_opts = {
                ['--pointer'] = '▌',
                ['--highlight-line'] = true,
                ['--color'] = 'gutter:-1',
                ['--scrollbar'] = '█',
                ['--info'] = 'hidden',
                ['--no-bold'] = '',
            },
            files = {
                git_icons = false,
                cwd_prompt = false,
                formatter = 'path.filename_first',
                no_header = true,
            },
            buffers = {
                no_header = true,
            },
            git = {
                status = {
                    preview_pager = preview_pager,
                    no_header = true,
                },
            },
            grep = {
                no_header = true,
                git_icons = false,
            },
            lsp = {
                no_header = true,
                symbols = {
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
