" ==========================
" = Yi's VIM configuration =
" ==========================

" This is the personal vim configuration
" modified from Steve Francia's ultimate .vimrc configuration
" The theme I chose requires 256 color support

" Environment Setups
set nocompatible

" Setup Bundle Support
runtime! autoload/pathogen.vim
silent! call pat`hogen#runtime_append_all_bundles()


" ----------------
" General Settings
" ----------------

	set background=dark			" Assume a dark background
	set term=xterm
	filetype plugin indent on	" Automatically detect file types
	set t_Co=256 				" Enable 256 colors
	syntax on					" Turn on syntax highlighting
	set mouse=a					" Enable xterm mouse support
	scriptencoding utf-8
	set autowrite				" Automatically write a file when leaveing
								" a modified buffer
	set shortmess+=filmnrxoOtT	" abbrev. of message (avoid 'Hit Enter')
	set viewoptions=folds,options,cursor,unix,slash	" better unix / windows compatibility
	set virtualedit=onemore		" allow for cursor beyond last character
	set history=1000			" Store a ton of history

	" ---- Directory Setup ----
		set backup
		set backupdir=$HOME/.vim/.vimbackup//
		set directory=$HOME/.vim/.vimswap//
		set viewdir=$HOME/.vim/.vimviews//

		"" Create directories if they don't exist
		silent execute '!mkdir -p $HOME/.vim'
		silent execute '!mkdir -p $HOME/.vim/.vimbackup'
		silent execute '!mkdir -p $HOME/.vim/.vimswap'
		silent execute '!mkdir -p $HOME/.vim/.vimviews'

" ------------
"    Vim UI
" ------------
	colorscheme wombat		" Select the desired colorscheme
	set tabpagemax=15		" only show 15 tabs
	set showmode			" display the current mode

	set cursorline			" highlight current line
	hi cursorline guibg=#333333	" highlight bg color of current line
	hi CursorColumn guibg=#333333	" highlight cursor

	if has('cmdline_info')
		set ruler			" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroid
		set showcmd			" show partial commands in status line and
							" selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=1	" show statusline only if there are >1 windows
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start	" backspace for dummys
	set linespace=0					" No extra spaces between rows
	set nu					" Line numbers on
	set showmatch			" show matching brackets/parenthesis
	set incsearch			" find as you type search
	set hlsearch			" highlight search terms
	set winminheight=0		" windows can be 0 line high
	set ignorecase			" case insensitive search
	set smartcase			" case sensitive when uc present
	set wildmenu			" show list instead of just completing
	set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5		" lines to scroll when cursor leaves screen
	set scrolloff=3			" minimum lines to keep above and below cursor
	"set foldenable			" auto fold code
	set gdefault			" the /g flags on :s substitutions by default

" -------------------------------
"  MacVim specific look and feel
" -------------------------------
	"set guifont=TerminusBold:h16	" Set the display font
	"set noantialias					" Disable the anti-aliasing rendering
	set guifont=Consolas:h16


" ------------
"  Formatting
" ------------
	set nowrap				" wrap long lines
	set autoindent			" indent at the same level of the previous line
	set smartindent
	set shiftwidth=4		" use indents of 4 spaces
	set noexpandtab			" tabs are tabs, not spaces
	set tabstop=4			" an indentation every four columns
	set pastetoggle=<F12>			" pastetoggle (sane indentation on pastes)
	set comments=sl:/*,mb:*,elx:*/	" auto format comment blocks


" ------------
" Key mappings
" ------------
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	
	" Shortcuts
	
	" Change Working Directory to that of the current file
	cmap cwd lcd %:p:h
