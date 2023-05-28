local ok, neoscroll, config

ok, neoscroll = pcall(require, "neoscroll")
if not ok then
  vim.notify("neoscroll could not be loadedlspconfig")
  return
end

neoscroll.setup({
  mappings = {
    "<C-u>",
    "<C-d>",
  },
  hide_cursor = false,
  stop_eof = false,
  respect_scrolloff = true,
  cursor_scrolls_alone = false,
  easing_function = nil,
  pre_hook = nil,
  post_hook = nil,
  performance_mode = false,
})

local t = {}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "300" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "300" } }

ok, config = pcall(require, "neoscroll.config")
if not ok then
  vim.notify("neoscroll.config could not be loadedlspconfig")
  return
end

config.set_mappings(t)
