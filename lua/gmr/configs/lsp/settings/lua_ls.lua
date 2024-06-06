-- https://luals.github.io/wiki/settings/
local config = {
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
                keywordSnippet = 'Replace',
            },
            hint = { enable = true },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
}

return config
