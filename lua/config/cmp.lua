local luasnip_loaded, luasnip = pcall(require, "luasnip")

if not luasnip_loaded then
    print("luasnip not loaded")
    return
end

local custom_snippets_path = vim.fn.stdpath("config") .. "/custom-snippets"
local data_path = vim.fn.stdpath("data")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        custom_snippets_path,
        data_path .. "/lazy/friendly-snippets",
        data_path .. "/lazy/vscode-react-javascript-snippets",
    },
})

local cmp_loaded, cmp = pcall(require, "cmp")

if not cmp_loaded then
    print("cmp not loaded")
    return
end

if cmp == nil then
    print("cmp is nil")
    return
end

local function border(hl_name)
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

local types = require("cmp.types")

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    preselect = types.cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = types.cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    confirmation = { default_behavior = types.cmp.ConfirmBehavior.Replace },
    window = {
        completion = {
            border = border("CmpMenuBorder"),
            winhighlight = "Normal:CmpMenu,CursorLine:CmpMenuSel,Search:None",
        },
        documentation = { border = border("CmpDocBorder"), winhighlight = "Normal:CmpDoc" },
    },
})

luasnip.filetype_extend("django-html", { "html" })
luasnip.filetype_extend("ejs", { "html" })
luasnip.filetype_extend("handlebars", { "html" })
luasnip.filetype_extend("hbs", { "html" })
luasnip.filetype_extend("htmldjango", { "html" })
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("pug", { "html" })
luasnip.filetype_extend("typescript", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
