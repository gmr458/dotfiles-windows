lua << EOF

require("settings")
require("plugins-list")
require("config-plugins")
require("mappings")

vim.cmd("hi NvimTreeVertSplit ctermbg=none guibg=none")
vim.cmd("let &fcs='eob: '")

EOF

set fillchars+=vert:\ 
