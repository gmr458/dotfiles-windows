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
Plug 'mxw/vim-jsx'
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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'norcalli/nvim-colorizer.lua'
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
set guifont=CaskaydiaCove\ NF:h14

language en_US

" NERDTree Lua
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.vscode' ]
let g:nvim_tree_indent_markers = 1
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
		["s"]              = tree_cb("vsplit"),
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

	require'nvim-web-devicons'.setup {

		override = {

			js = {

				icon = "",
				color = "#f0dc4e",
				name = "Js"

			},

			ts = {
				
				icon = "ﯤ",
				color = "#3178c6",
				name = "Ts"

			},

			html = {
				
				icon = "",
				color = "#dd4b25",
				name = "Html"

			},

			md = {
				
				icon = "",
				color = "#000000",
				name = "Md"

			},

			yaml = {
				
				icon = "",
				color = "#000000",
				name = "Yaml"

			},

			yml = {
				
				icon = "",
				color = "#000000",
				name = "Yml"

			},

			rs = {
				
				icon = "",
				color = "#f04801",
				name = "Rs"

			},

			[".gitignore"] = {
				
				icon = "",
				color = "#e84e31",
				name = "Gitignore"

			},

			["package.json"] = {
				
				icon = "",
				color = "#019833"

			},

			["package-lock.json"] = {
				
				icon = "",
				color = "#019833"

			},

			[".env"] = {
				
				icon = "",
				color = "#019833"

			}

		};

	}

EOF

" Shorcuts
let mapleader=" "
nmap <Leader>wq :wq<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>bd :bd!<CR>
nmap <Leader>ls :ls<CR>
nmap <Leader>pli :PlugInstall<CR>
nmap <Leader>plc :PlugClean<CR>
nmap <Leader>y :y$<CR>
nmap <Leader>initdeno :CocCommand deno.initializeWorkspace<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <Leader>r :NvimTreeRefresh<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <Leader>rn <Plug>(coc-rename)

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' .&keywordprg . " " . expand('<cword>')
	endif
endfunction

" JSON
let g:vim_json_warnings = 0

" Rainbow config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadBraces

let g:airline_powerline_fonts = 0
colorscheme gruvbox
"hi Normal guibg=NONE ctermbg=NONE

" Neovide
let g:neovide_refresh_rate=60
let g:neovide_cursor_antialiasing=v:true
let g:neovide_fullscreen=v:true
