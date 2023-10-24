local settings = {
    settings = {
        gopls = {
            gofumpt = true,
            analyses = {
                -- fieldalignment = true,
                nilness = true,
                -- unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            usePlaceholders = false,
        },
    },
}

return settings
