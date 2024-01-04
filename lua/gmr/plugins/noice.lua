return {
    'folke/noice.nvim',
    config = function()
        require('noice').setup {
            cmdline = {
                enabled = false,
            },
            messages = {
                enabled = false,
            },
            popupmenu = {
                enabled = false,
            },
            notify = {
                enabled = false,
            },
            lsp = {
                progress = {
                    enabled = false,
                },
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = false,
                },
                message = {
                    enabled = false,
                },
            },
            views = {
                hover = {
                    size = { max_width = 75 },
                },
            },
            presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = false,
                inc_rename = false,
                lsp_doc_border = true,
            },
        }
    end,
    dependencies = { 'MunifTanjim/nui.nvim' },
}
