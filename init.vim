" set the runtime path to include VimPlug and initialize
call plug#begin()
" Keep Plugin commands between vundle#begin/end.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/LargeFile'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-abolish'
"Plugin 'ycm-core/YouCompleteMe'
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set wildmenu
set visualbell
set history=50
set undolevels=1000
set ruler
set showcmd
set showmatch
set showmode
set laststatus=2
set textwidth=0
set smartcase
set incsearch
set hlsearch
set autochdir

" set the global tag files here
set tags=./tags;

" toggle line numbers on/off
set nu
" tabs to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
" set path
set path=$PWD
" highlight current line
set cursorline
" set line wrapping
set wrap
" backspace behaviour
set backspace=indent,eol,start
" Autocommands for buffer loading
autocmd FileType verilog_systemverilog    setlocal expandtab shiftwidth=2 softtabstop=2 tags=./tags; foldmethod=syntax 
autocmd FileType c                        setlocal expandtab cindent shiftwidth=2 softtabstop=2 foldmethod=syntax
autocmd FileType python                   setlocal expandtab cindent shiftwidth=2 softtabstop=2 foldmethod=syntax

autocmd BufNewFile,BufRead *.sv,*.svh,*.sva,*.svi,*.v,*.veo set filetype=verilog_systemverilog
autocmd BufRead,BufNewFile *.spec setlocal filetype=verilog_systemverilog
autocmd BufRead,BufNewFile *.json,*.jsn              setfiletype=javascript
autocmd BufNewfile,BufRead *.regspec,*.flatspec setfiletype=yaml
autocmd BufRead *.log set autoread | au CursorHold * checktime


syntax on
" add mouse support
set mouse=a
" colorscheme related changes go here
set background=dark
" gruvbox related options
" let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox
" colorscheme codedark
" Setting nice vsplits
set fillchars=vert:\ ,fold:\ ,diff:-
highlight EndOfBuffer ctermfg=bg guifg=bg
highlight VertSplit ctermbg=grey ctermfg=0 guibg=cyan guifg=cyan
highlight Folded ctermfg=grey guifg=grey cterm=NONE gui=NONE
" GUI related options
" GuiFont Noto Mono for Powerline:h7 
set linespace=8
set guioptions=
" Large File related options
let g:LargeFile = 1000
" Airline related options
" let AirlineTheme="iceberg"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
set updatetime=100
" gitgutter changes here
set signcolumn=yes 
" nerd tree commands here
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | endif
" Sync Nerdtree with cd
let g:NERDTreeChDirMode = 2
" custom aliases go here
command -nargs=* Tn tabnew <args>
command -nargs=* Vt vert term <args>
command -nargs=1 Vr vert rightbelow sb <args>
command -nargs=1 Vl vert leftabove sb <args>
" custom keymaps go here
let mapleader=","
map <leader>o :NERDTreeToggle<CR>
map <leader>l :ls<CR>:b
map <leader>cc :cclose<CR>
map <leader>co :copen<CR>
map <C-p> : GFiles<CR>
map <C-b> : Buffers<CR>
map <C-f> : Rg<CR>
map <C-t> : Tags<CR>
nnoremap Y yiw
nnoremap D diw
" Lint related options
let g:ale_verilog_xvlog_options='--sv'
let g:ale_verilog_xvlog_executable='/home/vasanth/tools/Vivado/2023.1/bin/xvlog'
let g:ale_linters_explicit=1
let g:ale_set_balloons=1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_set_quickfix = 1
" let g:ale_completion_enabled = 1
let g:ale_linters = {"c":["cc"], "cpp":["cc"], "python":["pylint"], "verilog_systemverilog":['xvlog']}
let g:ale_c_parse_makefile = 1
" Folding related options
let g:verilog_syntax_fold_lst = "all"
" Tagbar related options
let g:tagbar_width = 30
nnoremap <leader>t :TagbarToggle<CR>
" Ask Airline to STFU
let g:airline_extensions = ['ale', 'bookmark', 'quickfix', 'tabline', 'term', 'branch', 'fzf', 'gutentags', 'hunks'] 
