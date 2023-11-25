local M = {}

local utils = require 'config.utils'

local list = {
    'astro',
    'bash',
    'c',
    'c_sharp',
    'cmake',
    'comment',
    'cpp',
    'css',
    'csv',
    'dart',
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
    'gpg',
    'html',
    'htmldjango',
    'http',
    'hurl',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'kdl',
    'kotlin',
    'lua',
    'luadoc',
    'luadoc',
    'luap',
    'luau',
    'markdown',
    'markdown_inline',
    'ninja',
    'ocaml',
    'ocaml_interface',
    'ocamllex',
    'php',
    'phpdoc',
    'prisma',
    'proto',
    'pymanifest',
    'python',
    'query',
    'r',
    'rasi',
    'regex',
    'requirements',
    'ruby',
    'rust',
    'scheme',
    'scss',
    'sql',
    'svelte',
    'swift',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'vue',
    'xml',
    'yaml',
    'zig',
}

function M.install_automatically()
    if
        vim.fn.has 'win32' == 1
        or utils.running_wsl()
        or utils.running_android()
    then
        return {}
    end

    return list
end

return M
