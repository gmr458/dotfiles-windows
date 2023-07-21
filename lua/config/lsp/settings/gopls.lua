local settings = {
  settings = {
    gopls = {
      gofumpt = true,
      -- codelenses = {
      --   gc_details = false,
      --   generate = true,
      --   regenerate_cgo = true,
      --   run_govulncheck = true,
      --   test = true,
      --   tidy = true,
      --   upgrade_dependency = true,
      --   vendor = true,
      -- },
      analyses = {
        -- fieldalignment = true,
        nilness = true,
        -- unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = false,
      semanticTokens = false,
      noSemanticString = true,
      noSemanticNumber = false,
    },
  },
}

return settings
