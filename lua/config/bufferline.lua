local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify("bufferline could not be loaded")
  return
end

bufferline.setup({
  options = {
    indicator = { icon = " " },
    separator_style = { "", "" },
    sort_by = "insert_at_end",
    offsets = { { filetype = "NvimTree", text = "" } },
  },
  highlights = { buffer_selected = { italic = false, bold = false } },
})
