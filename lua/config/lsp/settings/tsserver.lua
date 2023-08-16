local ok, util = pcall(require, "lspconfig.util")
if not ok then
  vim.notify("lspconfig.util could not be loaded")
  return
end

local config = {
  root_dir = util.root_pattern("package.json"),
  single_file_support = true,
  settings = {
    diagnostics = {
      ignoredCodes = { 80001 },
    },
  },
}

return config
