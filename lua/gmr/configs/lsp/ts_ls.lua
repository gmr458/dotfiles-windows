local M = {}

M.go_to_source_definition = function()
    local params = vim.lsp.util.make_position_params(nil, 'utf-8')

    vim.lsp.buf_request(0, 'workspace/executeCommand', {
        command = '_typescript.goToSourceDefinition',
        arguments = { params.textDocument.uri, params.position },
    }, nil)
end

return M
