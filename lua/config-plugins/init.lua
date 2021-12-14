require("config-plugins.highlighting")

if vim.fn.has("unix") == 1 then
    require("config-plugins.lsp-cmp-saga")
else
    require("config-plugins.lsp-cmp-saga-windows")
end

require("config-plugins.format")
require("config-plugins.statusbar")
require("config-plugins.fuzzy-finder")
require("config-plugins.autopairs")
require("config-plugins.autotag")
require("config-plugins.buffers")
require("config-plugins.color")
require("config-plugins.comments")
require("config-plugins.tree")
require("config-plugins.git")
