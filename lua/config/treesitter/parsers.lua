local M = {}

function M.install_automatically()
    local utils = require 'config.utils'

    if
        vim.uv.os_uname().sysname == 'Windows_NT'
        or utils.running_wsl()
        or utils.running_android()
    then
        return {}
    end

    return {
        'astro',
        'c',
        'c_sharp',
        'css',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'htmldjango',
        'java',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'kdl',
        'lua',
        'luadoc',
        'luap',
        'luau',
        'markdown',
        'markdown_inline',
        'ocaml',
        'ocaml_interface',
        'ocamllex',
        'python',
        'query',
        'regex',
        'requirements',
        'rust',
        'scheme',
        'sql',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
    }
end

return M
