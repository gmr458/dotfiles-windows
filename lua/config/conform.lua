local ok, conform = pcall(require, 'conform')
if not ok then
    vim.notify 'conform could not be loaded'
    return
end

local path = vim.fn.stdpath 'data'

conform.setup {
    formatters = {
        gofumpt = { command = path .. '/mason/packages/gofumpt/gofumpt' },
        prettierd = {
            command = path
                .. '/mason/packages/prettierd/node_modules/.bin/prettierd',
        },
        ruff_format = { command = path .. '/mason/packages/ruff/venv/bin/ruff' },
        stylua = { command = path .. '/mason/packages/stylua/stylua' },
    },
    formatters_by_ft = {
        css = { 'prettierd' },
        go = { 'gofumpt' },
        html = { 'prettierd' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
    },
}
