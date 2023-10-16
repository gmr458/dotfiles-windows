local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter.configs could not be loaded")
  return
end

configs.setup({
  ensure_installed = require("config.treesitter.parsers").install_automatically(),
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok_stats, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok_stats and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
  },
})
