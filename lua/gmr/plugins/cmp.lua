return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'FelipeLema/cmp-async-path' },
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
    },
    config = function()
        local luasnip = require 'luasnip'
        local cmp = require 'cmp'

        -- local has_words_before = function()
        --     unpack = unpack or table.unpack
        --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --     return col ~= 0
        --         and vim.api
        --                 .nvim_buf_get_lines(0, line - 1, line, true)[1]
        --                 :sub(col, col)
        --                 :match '%s'
        --             == nil
        -- end

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
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered { border = 'single' },
                documentation = cmp.config.window.bordered { border = 'single' },
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<C-Space>'] = cmp.mapping.complete(),
                -- ['<Tab>'] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_next_item()
                --     elseif luasnip.expand_or_jumpable() then
                --         luasnip.expand_or_jump()
                --     elseif has_words_before() then
                --         cmp.complete()
                --     else
                --         -- fallback()
                --         require('neotab').tabout()
                --     end
                -- end, { 'i', 's' }),
                ['<Tab>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        require('neotab').tabout()
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
                { name = 'async_path' },
            }, {}),
        }
    end,
}
