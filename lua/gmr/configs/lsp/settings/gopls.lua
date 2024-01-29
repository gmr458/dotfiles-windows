-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
local settings = {
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = false,
            semanticTokens = false,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}

return settings
