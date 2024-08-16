return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
        { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function()
        local luasnip = require 'luasnip'
        local cmp = require 'cmp'

        local cmp_kinds = {
            Text = ' ',
            Method = ' ',
            Function = ' ',
            Constructor = ' ',
            Field = ' ',
            Variable = ' ',
            Class = ' ',
            Interface = ' ',
            Module = ' ',
            Property = ' ',
            Unit = ' ',
            Value = ' ',
            Enum = ' ',
            Keyword = ' ',
            Snippet = ' ',
            Color = ' ',
            File = ' ',
            Reference = ' ',
            Folder = ' ',
            EnumMember = ' ',
            Constant = ' ',
            Struct = ' ',
            Event = ' ',
            Operator = ' ',
            TypeParameter = ' ',
        }

        cmp.setup {
            preselect = cmp.PreselectMode.None,
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered {
                    border = 'single',
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
                },
                documentation = cmp.config.window.bordered {
                    border = 'single',
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
                },
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-m>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            formatting = {
                fields = { 'kind', 'abbr' },
                format = function(_, vim_item)
                    vim_item.kind = cmp_kinds[vim_item.kind] or ''
                    vim_item.menu = ''
                    return vim_item
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
            }, {}),
        }

        require 'gmr.configs.snippets'

        luasnip.filetype_extend('javascriptreact', { 'javascript' })
        luasnip.filetype_extend('typescriptreact', { 'typescript' })

        vim.api.nvim_create_autocmd('CursorHold', {
            group = vim.api.nvim_create_augroup(
                'gmr_cancel_snippet',
                { clear = true }
            ),
            desc = 'Cancel snippet and avoid cursor jumping to the first line of the file',
            callback = function()
                local ok, luasnip = pcall(require, 'luasnip')
                if not ok then
                    return
                end

                if luasnip.expand_or_jumpable() then
                    vim.cmd 'silent! lua require("luasnip").unlink_current()'
                end
            end,
        })
    end,
}
