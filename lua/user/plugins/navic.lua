local M = {
    'SmiteshP/nvim-navic',
    config = function()
        local navic = require 'nvim-navic'

        local icons = {
            disable = {
                File = 'file ',
                Module = 'module ',
                Namespace = 'namespace ',
                Package = 'package ',
                Class = 'class ',
                Method = 'method ',
                Property = 'property ',
                Field = 'field ',
                Constructor = 'constructor ',
                Enum = 'enum ',
                Interface = 'interface ',
                Function = 'function ',
                Variable = 'variable ',
                Constant = 'constant ',
                String = 'string ',
                Number = 'number ',
                Boolean = 'boolean ',
                Array = 'array ',
                Object = 'object ',
                Key = 'key ',
                Null = 'null ',
                EnumMember = 'enum member ',
                Struct = 'struct ',
                Event = 'event ',
                Operator = 'operator ',
                TypeParameter = 'type parameter ',
            },
            enable = {
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
        }

        navic.setup {
            icons = icons.enable,
            highlight = true,
            separator = '  ',
            depth_limit = 0,
            depth_limit_indicator = '..',
            safe_output = true,
        }
    end,
}

--- @param client lsp.Client
--- @param bufnr integer
function M.attach(client, bufnr)
    local method = vim.lsp.protocol.Methods.textDocument_documentSymbol

    if client.supports_method(method) then
        local filetype = vim.bo.filetype

        if
            client.name == 'html'
            and (filetype == 'javascriptreact' or filetype == 'typescriptreact')
        then
            return
        end

        local ok_navic, navic = pcall(require, 'nvim-navic')
        if not ok_navic then
            vim.notify 'nvim-navic could not be loaded'
            return
        end

        navic.attach(client, bufnr)
    end
end

return M
