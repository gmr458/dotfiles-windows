local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify("mason could not be loaded")
  return
end

mason.setup({
  PATH = "append",
  ui = {
    border = {
      "┌",
      "─",
      "┐",
      "│",
      "┘",
      "─",
      "└",
      "│",
    },
  },
})
