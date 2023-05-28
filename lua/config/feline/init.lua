local ok, feline, vscode_dark_modern

ok, feline = pcall(require, "feline")
if not ok then
  vim.notify("feline could not be loaded")
  return
end

ok, vscode_dark_modern = pcall(require, "vscode_dark_modern.integrations.feline")
if not ok then
  vim.notify("vscode_dark_modern.integrations.feline could not be loaded")
  return
end

feline.setup({
  force_inactive = {
    filetypes = {
      "^NvimTree$",
      "^packer$",
      "^startify$",
      "^fugitive$",
      "^fugitiveblame$",
      "^qf$",
      "^help$",
      "^TelescopePrompt$",
      "^alpha$",
      "^lsp%-installer$",
      "^lspinfo$",
      "^dashboard$",
    },
    buftypes = {
      "^terminal$",
    },
    bufnames = {},
  },
  disable = { filetypes = { "^alpha$", "^dashboard$" } },
  theme = vscode_dark_modern.palette(),
  components = vscode_dark_modern.components(),
})
