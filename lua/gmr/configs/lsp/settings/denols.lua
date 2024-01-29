local ok, util = pcall(require, 'lspconfig.util')
if not ok then
    vim.notify 'lspconfig.util could not be loaded'
    return
end

-- https://github.com/denoland/vscode_deno/blob/main/README.md
local config = {
    root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
    single_file_support = false,
    settings = {
        deno = {
            inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = {
                    enabled = 'all',
                    suppressWhenArgumentMatchesName = true,
                },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = {
                    enabled = true,
                    suppressWhenTypeMatchesName = true,
                },
            },
        },
    },
}

return config
