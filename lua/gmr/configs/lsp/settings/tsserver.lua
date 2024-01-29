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
}

return config
