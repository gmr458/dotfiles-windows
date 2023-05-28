local config = {
  settings = {
    ["rust-analyzer"] = {
      lens = {
        debug = { enable = true },
        enable = true,
        forceCustomCommands = true,
        implementations = { enable = false },
        location = "above_name",
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
        },
        run = { enable = true },
      },
    },
  },
}

return config
