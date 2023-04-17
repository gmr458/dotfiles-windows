local ok, scrollbar_search = pcall(require, "scrollbar.handlers.search")
if not ok then
    vim.notify("scrollbar.handlers.search could not be loaded")
    return
end

scrollbar_search.setup({ override_lens = function() end })
