local util = require 'lspconfig.util'

local root_files = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
}

local function organize_imports()
    local params = {
        command = 'pylance.organizeimports',
        arguments = { vim.uri_from_bufnr(0) },
    }

    local clients = vim.lsp.get_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = 'pylance',
    }
    print(#clients)
    for _, client in ipairs(clients) do
        local ok, _ = client.request('workspace/executeCommand', params, nil, 0)
        print(ok)
    end
end

local function set_python_path(path)
    local clients = vim.lsp.get_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = 'pylance',
    }
    for _, client in ipairs(clients) do
        client.config.settings = vim.tbl_deep_extend(
            'force',
            client.config.settings,
            { python = { pythonPath = path } }
        )
        client.notify('workspace/didChangeConfiguration', { settings = nil })
    end
end

return {
    default_config = {
        name = 'pylance',
        cmd = {
            'node',
            vim.fn.stdpath 'data' .. '/pylance/extension/dist/server.nvim.js',
            '--stdio',
        },
        filetypes = { 'python' },
        root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname)
        end,
        single_file_support = true,
        settings = {
            python = {
                analysis = {
                    autoImportCompletions = true,
                    autoImportUserSymbols = true,
                    diagnosticMode = 'workspace', -- openFilesOnly, workspace
                    typeCheckingMode = 'basic', -- off, basic, strict
                    completeFunctionParens = true,
                },
            },
        },
    },
    commands = {
        PylanceOrganizeImports = {
            organize_imports,
            description = 'Organize Imports',
        },
        PylanceSetPythonPath = {
            set_python_path,
            description = 'Reconfigure pylance with the provided python path',
            nargs = 1,
            complete = 'file',
        },
    },
    docs = {
        description = [[
https://github.com/microsoft/pylance-release

`pylance`, Fast, feature-rich language support for Python
]],
    },
}
