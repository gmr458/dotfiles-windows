local ok, util = pcall(require, 'lspconfig.util')
if not ok then
    vim.notify 'lspconfig.util could not be loaded'
    return
end

local config = {
    single_file_support = false,
}

return config
