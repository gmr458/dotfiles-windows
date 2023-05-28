local config = {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
        keywordSnippet = "Replace",
      },
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  },
}

return config
