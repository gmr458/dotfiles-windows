local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  vim.notify("nvim-ts-autotag could not be loaded")
  return
end

autotag.setup()
