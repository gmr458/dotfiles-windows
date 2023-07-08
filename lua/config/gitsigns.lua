local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("gitsigns could not be loaded")
  return
end

gitsigns.setup({
  signs = {
    delete = {
      hl = "GitSignsDelete",
      text = "",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
  },
  attach_to_untracked = false,
  trouble = false,
})

vim.api.nvim_create_user_command("ScrollbarEnable", function()
  local ok_scrollbar, scrollbar_gitsigns = pcall(require, "scrollbar.handlers.gitsigns")
  if not ok_scrollbar then
    vim.notify("scrollbar.handlers.gitsigns could not be loaded")
    return
  end

  scrollbar_gitsigns.setup()
end, {})
