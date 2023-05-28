local ok, colorizer = pcall(require, "colorizer")
if not ok then
  vim.notify("colorizer could not be loaded")
  return
end

colorizer.setup({
  filetypes = {
    "conf",
    "css",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "yaml",
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = false,
    AARRGGBB = true,
    rgb_fn = false,
    hsl_fn = false,
    css = false,
    css_fn = false,
    mode = "background",
  },
})
