local ok, util = pcall(require, 'lspconfig.util')
if not ok then
    vim.notify 'lspconfig.util could not be loaded'
    return
end

-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
local config = {
    root_dir = util.root_pattern 'package.json',
    single_file_support = false,
    settings = {
        diagnostics = {
            ignoredCodes = { 80001 },
        },
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                --- @type 'none' | 'literals' | 'all'
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            },
        },
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                --- @type 'none' | 'literals' | 'all'
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            },
        },
    },
    handlers = {
        --- @param err? lsp.ResponseError
        --- @param result? lsp.Location[]|lsp.LocationLink[]
        --- @param context lsp.HandlerContext
        --- @param config? table
        ['workspace/executeCommand'] = function(err, result, context, config)
            if context.params.command == '_typescript.goToSourceDefinition' then
                require('gmr.configs.lsp.handlers').go_to_definition(
                    err,
                    result,
                    context,
                    config
                )
            end
        end,
    },
}

return config
