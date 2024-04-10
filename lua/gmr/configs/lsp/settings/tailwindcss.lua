local ok, util = pcall(require, 'lspconfig.util')
if not ok then
    vim.notify 'lspconfig.util could not be loaded'
    return
end

local config = {
    root_dir = util.root_pattern(
        'tailwind.config.cjs',
        'tailwind.config.js',
        'tailwind.config.mjs',
        'tailwind.config.ts'
    ),
}

return config
