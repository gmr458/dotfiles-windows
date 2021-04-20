call plug#begin('$USERPROFILE\AppData\Local\nvim\plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'jparise/vim-graphql'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'"

call plug#end()

syntax enable
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set backspace=indent,eol,start
set encoding=UTF-8
set autoindent
set mouse=a
set incsearch
set noshowmode
set termguicolors

language en_US

" NERDTree Lua
let g:nvim_tree_side = 'left'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
highlight NvimTreeFolderIcon guibg=blue

lua <<EOF
	local tree_cb = require'nvim-tree.config'.nvim_tree_callback
	vim.g.nvim_tree_bindings = {
		["<CR>"] = ":YourVimFunction()<cr>",
		["u"] = ":lua require'some_module'.some_function()<cr>",

		-- default mappings
		["<CR>"]           = tree_cb("edit"),
		["o"]              = tree_cb("edit"),
		["<2-LeftMouse>"]  = tree_cb("edit"),
		["<2-RightMouse>"] = tree_cb("cd"),
		["<C-]>"]          = tree_cb("cd"),
		["s"]          = tree_cb("vsplit"),
		["<C-x>"]          = tree_cb("split"),
		["<C-t>"]          = tree_cb("tabnew"),
		["<"]              = tree_cb("prev_sibling"),
		[">"]              = tree_cb("next_sibling"),
		["<BS>"]           = tree_cb("close_node"),
		["<S-CR>"]         = tree_cb("close_node"),
		["<Tab>"]          = tree_cb("preview"),
		["I"]              = tree_cb("toggle_ignored"),
		["H"]              = tree_cb("toggle_dotfiles"),
		["R"]              = tree_cb("refresh"),
		["a"]              = tree_cb("create"),
		["d"]              = tree_cb("remove"),
		["r"]              = tree_cb("rename"),
		["<C-r>"]          = tree_cb("full_rename"),
		["x"]              = tree_cb("cut"),
		["c"]              = tree_cb("copy"),
		["p"]              = tree_cb("paste"),
		["[c"]             = tree_cb("prev_git_item"),
		["]c"]             = tree_cb("next_git_item"),
		["-"]              = tree_cb("dir_up"),
		["q"]              = tree_cb("close"),
	}
EOF

" Easymotion
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nto :NvimTreeOpen<CR>
nmap <Leader>ntc :NvimTreeClose<CR>
nmap <Leader>ntr :NvimTreeRefresh<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>bd :bd!<CR>
nmap <Leader>ls :ls<CR>
nmap <Leader>pli :PlugInstall<CR>
nmap <Leader>plc :PlugClean<CR>
nmap <Leader>y :y$<CR>
nmap <Leader>initdeno :CocCommand deno.initializeWorkspace<CR>

" JSON
let g:vim_json_warnings = 0

" Rainbow config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadBraces

let g:airline_powerline_fonts = 0
let g:dracula_italic = 0
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
