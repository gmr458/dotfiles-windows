return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    cmd = 'Telescope',
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'
        local actions_layout = require 'telescope.actions.layout'
        local previewers = require 'telescope.previewers'

        local layout_fullscreen = {
            layout_strategy = 'vertical',
            layout_config = {
                prompt_position = 'top',
                width = { padding = 0 },
                height = { padding = 0 },
                preview_cutoff = 1,
                mirror = true,
            },
        }

        telescope.setup {
            defaults = {
                path_display = { 'filename_first' },
                mappings = {
                    n = {
                        ['<C-y>'] = actions_layout.toggle_preview,
                    },
                    i = {
                        ['<Tab>'] = actions.move_selection_worse,
                        ['<S-Tab>'] = actions.move_selection_better,
                        ['<C-y>'] = actions_layout.toggle_preview,
                    },
                },
                prompt_prefix = '   ',
                selection_caret = '  ',
                multi_icon = '',
                sorting_strategy = 'ascending',
                layout_strategy = nil,
                layout_config = nil,
                borderchars = {
                    '─',
                    '│',
                    '─',
                    '│',
                    '┌',
                    '┐',
                    '┘',
                    '└',
                },
                color_devicons = true,
                set_env = {
                    ['COLORTERM'] = 'truecolor',
                    LESS = '',
                    DELTA_PAGER = 'less',
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case',
                    },
                },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--hidden',
                },
            },
            pickers = {
                buffers = {
                    previewer = false,
                    layout_config = {
                        width = 0.7,
                        prompt_position = 'top',
                    },
                },
                builtin = {
                    previewer = false,
                    layout_config = {
                        width = 0.3,
                        prompt_position = 'top',
                    },
                },
                find_files = {
                    previewer = false,
                    layout_strategy = 'vertical',
                    layout_config = {
                        prompt_position = 'top',
                        width = 0.5,
                        height = 0.7,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                git_status = vim.tbl_deep_extend('force', {
                    mappings = {
                        i = {
                            ['<Tab>'] = actions.move_selection_worse,
                            ['<S-Tab>'] = actions.move_selection_better,
                        },
                    },
                    previewer = previewers.new_termopen_previewer {
                        get_command = function(entry, _)
                            local cmd = {
                                'git',
                                '-c',
                                'core.pager=delta',
                                '-c',
                                'delta.side-by-side=false',
                                '-c',
                                'delta.line-numbers=true',
                                '-c',
                                'delta.hunk-header-style=omit',
                                '-c',
                                'delta.file-style=omit',
                                'diff',
                            }

                            if entry.status == 'A ' then
                                table.insert(cmd, '--cached')
                            end

                            table.insert(cmd, entry.value)

                            return cmd
                        end,
                    },
                }, layout_fullscreen),
                help_tags = {
                    layout_config = {
                        prompt_position = 'top',
                        scroll_speed = 4,
                        width = { padding = 0 },
                        height = { padding = 0 },
                        preview_width = 0.6,
                    },
                },
                live_grep = layout_fullscreen,
                lsp_document_symbols = layout_fullscreen,
                lsp_dynamic_workspace_symbols = layout_fullscreen,
                lsp_implementations = layout_fullscreen,
                lsp_references = layout_fullscreen,
                oldfiles = {
                    previewer = false,
                    layout_config = {
                        prompt_position = 'top',
                        width = 0.9,
                    },
                },
            },
        }

        if not require('gmr.core.utils').running_android() then
            telescope.load_extension 'fzf'
        end
    end,
}
