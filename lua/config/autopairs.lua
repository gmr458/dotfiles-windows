local ok, autopairs, autopairs_cmp, cmp

ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("nvim-autopairs could not be loaded")
  return
end
autopairs.setup({})

ok, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
if not ok then
  vim.notify("nvim-autopairs.completion.cmp could not be loaded")
  return
end

ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("cmp could not be loaded")
  return
end

cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done({ map_char = { tex = "" } }))
