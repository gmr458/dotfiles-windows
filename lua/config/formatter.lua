local ok, formatter = pcall(require, 'formatter')
if not ok then
    vim.notify 'formatter could not be loaded'
    return
end

local function biome()
    if not vim.uv.fs_stat 'biome.json' then
        return {
            exe = 'biome',
            args = {
                'format',
                '--indent-width',
                vim.bo.tabstop,
                '--stdin-file-path',
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    return {
        exe = 'biome',
        args = {
            'format',
            '--stdin-file-path',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

local prettier_config = function()
    local prettier_config_files = {
        '.prettierrc',
        'prettier.config.js',
        'prettier.config.cjs',
    }

    local config_file_exists = false

    for _, config_file in pairs(prettier_config_files) do
        local file = io.open(config_file, 'r')
        if file == nil or io.type(file) ~= 'file' then
            config_file_exists = false
        else
            file:close()
            config_file_exists = true
            break
        end
    end

    if not config_file_exists then
        return {
            exe = 'prettier',
            args = {
                '--tab-width',
                vim.bo.tabstop,
                '--stdin-filepath',
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    return {
        exe = 'prettier',
        args = {
            '--stdin-filepath',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

formatter.setup {
    logging = false,
    filetype = {
        css = { prettier_config },
        go = { require('formatter.filetypes.go').gofumpt },
        html = { prettier_config },
        htmldjango = {
            function()
                return {
                    exe = 'djlint',
                    args = {
                        '--reformat',
                        '--preserve-leading-space',
                        '--preserve-blank-lines',
                        '--indent',
                        vim.bo.tabstop,
                    },
                }
            end,
        },
        javascript = { biome },
        javascriptreact = { biome },
        json = { biome },
        jsonc = { biome },
        lua = require('formatter.filetypes.lua').stylua,
        ocaml = {
            function()
                return {
                    exe = 'ocamlformat',
                    args = {
                        '--enable-outside-detected-project',
                        '--break-cases=toplevel',
                        vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
        python = require('formatter.filetypes.python').ruff,
        rust = require('formatter.filetypes.rust').rustfmt,
        scss = { prettier_config },
        toml = require('formatter.filetypes.toml').taplo,
        typescript = { biome },
        typescriptreact = { biome },
    },
}
