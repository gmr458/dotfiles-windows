return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
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
        local actions_layout = require 'telescope.actions.layout'

        telescope.setup {
            defaults = {
                mappings = {
                    n = {
                        ['<C-y>'] = actions_layout.toggle_preview,
                    },
                    i = {
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
                set_env = { ['COLORTERM'] = 'truecolor' },
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
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                git_status = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                help_tags = {
                    layout_config = {
                        prompt_position = 'top',
                        scroll_speed = 4,
                        height = 0.9,
                        width = 0.9,
                        preview_width = 0.55,
                    },
                },
                live_grep = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                lsp_document_symbols = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                lsp_dynamic_workspace_symbols = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                lsp_implementations = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                lsp_references = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                oldfiles = {
                    previewer = false,
                    layout_config = {
                        width = 0.9,
                        prompt_position = 'top',
                    },
                },
            },
        }

        if not require('gmr.core.utils').running_android() then
            telescope.load_extension 'fzf'
        end
    end,
}
