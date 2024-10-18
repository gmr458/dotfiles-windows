local function prettier_biome(bufnr)
    local prettier_config_files = {
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yml',
        '.prettierrc.yaml',
        '.prettierrc.json5',
        '.prettierrc.js',
        'prettier.config.js',
        '.prettierrc.mjs',
        'prettier.config.mjs',
        '.prettierrc.cjs',
        'prettier.config.cjs',
        '.prettierrc.toml',
    }

    local prettier_config_file_exists = false

    for _, config_file in pairs(prettier_config_files) do
        if vim.uv.fs_stat(config_file) then
            prettier_config_file_exists = true
            break
        end
    end

    if prettier_config_file_exists then
        return { 'prettier' }
    end

    return { 'biome' }
end

return {
    'stevearc/conform.nvim',
    cmd = 'Format',
    config = function()
        local conform = require 'conform'

        conform.setup {
            notify_on_error = false,
            formatters_by_ft = {
                astro = { 'prettier' },
                cs = { 'csharpier' },
                css = prettier_biome,
                dart = { 'dart_format' },
                gleam = { 'gleam' },
                go = { 'gofumpt' },
                html = { 'prettier' },
                htmldjango = { 'djlint' },
                java = { 'google-java-format' },
                javascript = prettier_biome,
                javascriptreact = prettier_biome,
                json = prettier_biome,
                jsonc = prettier_biome,
                kotlin = { 'ktlint' },
                lua = { 'stylua' },
                ocaml = { 'ocamlformat' },
                php = { 'pint' },
                proto = { 'buf' },
                python = { 'ruff_format' },
                scss = { 'prettier' },
                svelte = { 'prettier' },
                template = { 'prettier' },
                toml = { 'taplo' },
                typescript = prettier_biome,
                typescriptreact = prettier_biome,
                yaml = { 'yamlfmt' },
            },
        }

        conform.formatters.ocamlformat = {
            prepend_args = {
                '--enable-outside-detected-project',
                '--break-cases=toplevel',
                '--if-then-else=fit-or-vertical',
            },
        }

        vim.api.nvim_create_user_command('Format', function()
            require('conform').format()
        end, {})
    end,
}
