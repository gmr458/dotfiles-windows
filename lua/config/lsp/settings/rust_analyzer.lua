local config = {
    settings = {
        ["rust-analyzer"] = {
            lens = {
                debug = { enable = false },
                enable = true,
                forceCustomCommands = true,
                implementations = { enable = true },
                location = "above_name",
                references = {
                    adt = { enable = true },
                    enumVariant = { enable = true },
                    method = { enable = true },
                    trait = { enable = true },
                },
                run = { enable = false },
            },
            typing = {
                autoClosingAngleBrackets = { enable = true },
            },
        },
    },
}

return config
