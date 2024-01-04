local config = {
    settings = {
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false,
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = 'workspace', -- openFilesOnly, workspace
                typeCheckingMode = 'basic', -- off, basic, strict
                useLibraryCodeForTypes = true,
            },
        },
    },
    single_file_support = true,
}

return config
