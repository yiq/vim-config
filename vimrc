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
silent! call pathogen#infect('3rd_parties')
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

" enable modeline
set modeline


" ----------------
" General Settings
" ----------------

    syntax on                   " Turn on syntax highlighting
    set background=dark         " Assume a dark background
    set term=xterm
    filetype plugin indent on   " Automatically detect file types
    set t_Co=256                " Enable 256 colors
    set t_ut=                   " disable Background Color Erase"
    set mouse=a                 " Enable xterm mouse support
    scriptencoding utf-8
    set autowrite               " Automatically write a file when leaveing
                                " a modified buffer
    set shortmess+=filmnrxoOtT  " abbrev. of message (avoid 'Hit Enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore     " allow for cursor beyond last character
    set history=1000            " Store a ton of history

    set ft=text                 " set default filetype to plain text

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
    colorscheme hybrid
    set tabpagemax=15       " only show 15 tabs
    set showmode            " display the current mode

    set cursorline          " highlight current line

    " highlight bg color of current line
    hi cursorline guibg=#333333

    " highlight cursor
    hi CursorColumn guibg=#333333

    if has('cmdline_info')
        set ruler           " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroid
        set showcmd         " show partial commands in status line and
                            " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2    " show statusline only if there are >1 windows
        set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %y\ %P
    endif

    set backspace=indent,eol,start  " backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set foldmethod=syntax           " syntax based code folding
    set gdefault                    " the /g flags on :s substitutions by default
    set listchars=tab:▸\ ,eol:¬     " Use textmate symbols for tabstops and EOLs"

" -------------------------------
"  MacVim specific look and feel
" -------------------------------
    set guifont=ProggyCleanTT:h16  " Set the display font
    "set noantialias                        " Disable the anti-aliasing rendering
    let g:airline_powerline_fonts = 0


" ------------
"  Formatting
" ------------
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set smartindent
    set expandtab                   " expand tabs into spaces
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4
    set shiftwidth=4                " use indents of 4 spaces
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    set conceallevel=0              " Don't hide json quote marks

    " file type specific tab settings
    if has("autocmd")
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    endif


" ------------
" Key mappings
" ------------
    " Easier moving in tabs and windows
    map         <C-J>       <C-W>j<C-W>_
    map         <C-K>       <C-W>k<C-W>_
    map         <C-L>       <C-W>l<C-W>_
    map         <C-H>       <C-W>h<C-W>_

    " Disable arrow key to force nagivate with h,j,k,l
    inoremap    <Up>        <NOP>
    inoremap    <Down>      <NOP>
    inoremap    <Left>      <NOP>
    inoremap    <Right>     <NOP>
    noremap     <Up>        <NOP>
    noremap     <Down>      <NOP>
    noremap     <Left>      <NOP>
    noremap     <Right>     <NOP>

    " Shortcut to rapidly toggle `set list`
    nmap        <leader>l   :set list!<CR>

    " Shortcuts
    silent! map <F5>        :NERDTreeToggle<CR>

    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

" ---------
" Shortcuts
" ---------
    abbr        #b  /****************************************************************
    abbr        #e  *****************************************************************/
    iab <expr>  ds  strftime("%b %d, %Y")

" -----------
" Programming
" -----------
    let Tlist_Ctags_Cmd="/opt/ctags-5.8/bin/ctags"  " Setexuberant ctags location


" --------------------------
"  Plugin Specific Settings
" --------------------------
    " vim-javascript
    let g:javascript_conceal_function       = "ƒ"
    let g:javascript_conceal_null           = "ø"
    let g:javascript_conceal_this           = "@"
    let g:javascript_conceal_return         = "⇚"
    let g:javascript_conceal_undefined      = "¿"
    let g:javascript_conceal_NaN            = "ℕ"
    let g:javascript_conceal_prototype      = "¶"
    let g:javascript_conceal_static         = "•"
    let g:javascript_conceal_super          = "Ω"
    let g:javascript_conceal_arrow_function = "⇒"

    " syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = "-std=c++14"
    let g:syntastic_cpp_include_dirs = ["/opt/includes"]

    let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-', 'proprietary attribute "ui-']
    let g:syntastic_html_tidy_blocklevel_tags = ['ui-view']

    " indent-guide
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=2
    
    " NERDtree
    let g:NERDTreeDirArrowExpandable="+"
    let g:NERDTreeDirArrowCollapsible="~"
    let NERDTreeIgnore = ['\.git$', '_build', 'deps', 'mix.lock', 'node_modules']
