local layout_normal = {
    layout = {
        preview = false,
        layout = {
            max_width = 70,
            height = 0.8,
            backdrop = false,
            box = 'vertical',
            {
                win = 'input',
                height = 1,
                border = 'solid',
            },
            {
                win = 'list',
                border = 'solid',
            },
        },
    },
}

local function get_layout_fullscreen_vertical(width_preview)
    return {
        layout = {
            fullscreen = true,
            layout = {
                backdrop = false,
                box = 'horizontal',
                {
                    box = 'vertical',
                    {
                        win = 'input',
                        height = 1,
                        border = 'solid',
                    },
                    {
                        win = 'list',
                        border = 'solid',
                    },
                },
                {
                    win = 'preview',
                    width = width_preview,
                    border = 'solid',
                },
            },
        },
    }
end

local layout_fullscreen_horizontal = {
    layout = {
        fullscreen = true,
        layout = {
            backdrop = false,
            box = 'vertical',
            {
                win = 'input',
                height = 1,
                border = 'solid',
            },
            { win = 'list', border = 'solid' },
            {
                win = 'preview',
                height = 0.6,
                border = 'vpad',
            },
        },
    },
}

local layout_fullscreen_vertical = {
    layout = {
        fullscreen = true,
        layout = {
            backdrop = false,
            box = 'horizontal',
            {
                box = 'vertical',
                {
                    win = 'input',
                    height = 1,
                    border = 'solid',
                },
                {
                    win = 'list',
                    border = 'solid',
                },
            },
            {
                win = 'preview',
                width = 0.6,
                border = 'solid',
            },
        },
    },
}

return {
    'folke/snacks.nvim',
    cmd = {
        'SnacksPickerFiles',
        'SnacksPickerGitStatus',
        'SnacksPickerGrep',
        'SnacksPickerHelp',
        'SnacksPickerBuffers',
        'SnacksPickerLspReferences',
        'SnacksPickerLspImplementations',
        'SnacksPickerLspDocumentSymbols',
        'SnacksPickerLspWorkspaceSymbols',
    },
    config = function()
        require('snacks').setup {
            bigfile = { enabled = false },
            dashboard = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            notifier = { enabled = false },
            picker = {
                prompt = ' ',
                formatters = {
                    file = {
                        filename_first = true,
                    },
                },
                previewers = {
                    git = {
                        native = true,
                    },
                },
                win = {
                    input = {
                        keys = {
                            ['<Tab>'] = { 'list_down', mode = { 'i', 'n' } },
                            ['<S-Tab>'] = { 'list_up', mode = { 'i', 'n' } },
                            ['<c-x>'] = { 'edit_split', mode = { 'i', 'n' } },
                            ['<c-u>'] = {
                                'preview_scroll_up',
                                mode = { 'i', 'n' },
                            },
                            ['<c-d>'] = {
                                'preview_scroll_down',
                                mode = { 'i', 'n' },
                            },
                        },
                    },
                },
                icons = {
                    kinds = {
                        Array = 'Array',
                        Boolean = 'Boolean',
                        Class = 'Class',
                        Color = 'Color',
                        Control = 'Control',
                        Collapsed = 'Collapsed',
                        Constant = 'Constant',
                        Constructor = 'Constructor',
                        Copilot = 'Copilot',
                        Enum = 'Enum',
                        EnumMember = 'EnumMember',
                        Event = 'Event',
                        Field = 'Field',
                        File = 'File',
                        Folder = 'Folder',
                        Function = 'Function',
                        Interface = 'Interface',
                        Key = 'Key',
                        Keyword = 'Keyword',
                        Method = 'Method',
                        Module = 'Module',
                        Namespace = 'Namespace',
                        Null = 'Null',
                        Number = 'Number',
                        Object = 'Object',
                        Operator = 'Operator',
                        Package = 'Package',
                        Property = 'Property',
                        Reference = 'Reference',
                        Snippet = 'Snippet',
                        String = 'String',
                        Struct = 'Struct',
                        Text = 'Text',
                        TypeParameter = 'TypeParameter',
                        Unit = 'Unit',
                        Unknown = 'Unknown',
                        Value = 'Value',
                        Variable = 'Variable',
                    },
                },
            },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        }

        vim.api.nvim_create_user_command('SnacksPickerFiles', function()
            Snacks.picker.files(layout_normal)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitBranches', function()
            Snacks.picker.git_branches(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitDiff', function()
            Snacks.picker.git_diff(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitFiles', function()
            Snacks.picker.git_diff(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitLog', function()
            Snacks.picker.git_log(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitLogFile', function()
            Snacks.picker.git_log_file(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitLogLine', function()
            Snacks.picker.git_log_line(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGitStatus', function()
            local layout = get_layout_fullscreen_vertical(0.8)
            local config = vim.tbl_deep_extend('force', layout, {
                win = {
                    input = {
                        keys = {
                            ['<Tab>'] = { 'list_down', mode = { 'i', 'n' } },
                            ['<S-Tab>'] = { 'list_up', mode = { 'i', 'n' } },
                        },
                    },
                },
            })
            Snacks.picker.git_status(config)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerGrep', function()
            Snacks.picker.grep(layout_fullscreen_horizontal)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerHelp', function()
            Snacks.picker.help(layout_fullscreen_vertical)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerBuffers', function()
            Snacks.picker.buffers(layout_normal)
        end, {})

        vim.api.nvim_create_user_command('SnacksPickerLspReferences', function()
            Snacks.picker.lsp_references(layout_fullscreen_horizontal)
        end, {})

        vim.api.nvim_create_user_command(
            'SnacksPickerLspImplementations',
            function()
                Snacks.picker.lsp_implementations(layout_fullscreen_horizontal)
            end,
            {}
        )

        vim.api.nvim_create_user_command(
            'SnacksPickerLspDocumentSymbols',
            function()
                Snacks.picker.lsp_symbols(layout_fullscreen_vertical)
            end,
            {}
        )

        vim.api.nvim_create_user_command(
            'SnacksPickerLspWorkspaceSymbols',
            function()
                Snacks.picker.lsp_workspace_symbols(layout_fullscreen_vertical)
            end,
            {}
        )
    end,
}
