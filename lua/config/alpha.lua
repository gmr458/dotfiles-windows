local ok, alpha, dashboard

ok, alpha = pcall(require, "alpha")
if not ok then
  vim.notify("alpha could not be loaded")
  return
end

ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not ok then
  vim.notify("alpha.themes.dashboard could not be loaded")
  return
end

dashboard.section.header.val = require("config.headers").Bloody
dashboard.section.header.opts = { position = "center", hl = "AlphaHeader" }

dashboard.section.buttons.val = {
  -- dashboard.button("tff", "  Find file", "<CMD>silent FzfLua files<CR>"),
  dashboard.button("tff", "  Find file", "<CMD>silent Telescope find_files no_ignore=false<CR>"),
  dashboard.button("tfg", "󰈞  Live grep", "<CMD>silent Telescope live_grep preview=true<CR>"),
  dashboard.button("tfg", "?  Help", "<CMD>silent Telescope help_tags preview=true<CR>"),
  dashboard.button("tfr", "󰈙  Recent File", "<CMD>silent Telescope oldfiles preview=false<CR>"),
  dashboard.button("cfg", "  Config", "<CMD>silent cd ~/.config/nvim | e init.lua<CR>"),
  dashboard.button("upd", "  Update plugins", "<CMD>Lazy update<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

for _, value in pairs(dashboard.section.buttons.val) do
  value.opts.hl_shortcut = "AlphaShorcut"
  value.opts.hl = "AlphaButton"
end

alpha.setup(dashboard.config)
