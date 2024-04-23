local function go_to_source_definition()
    vim.lsp.buf.execute_command {
        command = '_typescript.goToSourceDefinition',
        arguments = {
            vim.api.nvim_buf_get_name(0),
            vim.lsp.util.make_position_params().position,
        },
    }
end

local function organize_imports()
    local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = '',
    }
    vim.lsp.buf.execute_command(params)
end

local commands = {
    TSGoToSourceDefinition = {
        go_to_source_definition,
        description = 'Go to Source Definition',
    },
    TSOrganizeImports = {
        organize_imports,
        description = 'Organize Imports',
    },
}

return commands
