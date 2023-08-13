local ok, fzf, actions

ok, fzf = pcall(require, "fzf-lua")
if not ok then
  vim.notify("fzf-lua could not be loaded")
  return
end

ok, actions = pcall(require, "fzf-lua.actions")
if not ok then
  vim.notify("fzf-lua.actions could not be loaded")
  return
end

fzf.setup({
  "default",
  winopts = {
    height = 0.90,
    width = 0.90,
    row = 0.35,
    col = 0.50,
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    fullscreen = false,
    preview = {
      wrap = "nowrap",
      hidden = "hidden",
    },
    on_create = function()
      vim.keymap.set("t", "<Tab>", "<Down>", { silent = true, buffer = true })
      vim.keymap.set("t", "<S-Tab>", "<Up>", { silent = true, buffer = true })
    end,
  },
  actions = {
    files = {
      ["default"] = actions.file_edit,
      ["ctrl-x"] = actions.file_split,
      ["ctrl-v"] = actions.file_vsplit,
    },
  },
  files = { prompt = "Files  " },
})
