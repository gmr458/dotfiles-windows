local ok, ufo = pcall(require, 'ufo')
if not ok then
    vim.notify 'ufo could not be loaded'
    return
end

ufo.setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end,
}
