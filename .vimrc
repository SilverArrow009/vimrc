filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-unimpaired'
Plugin 'c.vim'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'tpope/vim-obsession'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dkprice/vim-easygrep'
Plugin 'dense-analysis/ale'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tomasiser/vim-code-dark'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/LargeFile'
Plugin 'lervag/vimtex'
"Plugin 'ycm-core/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
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
autocmd FileType verilog_systemverilog    setlocal expandtab shiftwidth=2 softtabstop=2 tags=./tags;,~/.vim/ctags/tags.uvm_1.2 foldmethod=syntax 
autocmd FileType perl                     setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c                        setlocal expandtab cindent shiftwidth=2 softtabstop=2 foldmethod=syntax
autocmd FileType python                   setlocal expandtab cindent shiftwidth=2 softtabstop=2

autocmd BufNewFile,BufRead *.sv,*.svh,*.sva,*.svi,*.vh,*.tie,*.cmd setfiletype=verilog_systemverilog
autocmd BufRead,BufNewFile *.spec setlocal filetype=verilog_systemverilog
autocmd BufRead,BufNewFile *.json,*.jsn              setfiletype=javascript
autocmd BufNewfile,BufRead *.regspec,*.flatspec setfiletype=yaml
autocmd BufRead *.log set autoread | au CursorHold * checktime

syntax on

nnoremap <F2> <C-W><C-W>
nnoremap <F3> <C-W>o
nnoremap <C-X> <NOP>
nnoremap <C-A> <NOP>
nnoremap D diw
" add mouse support
set mouse=a
" colorscheme related changes go here
set background=dark
" gruvbox related options
" let g:gruvbox_contrast_dark="medium"
" colorscheme gruvbox
" colorscheme iceberg
colorscheme codedark
" Setting nice vsplits
set fillchars=vert:\ ,fold:\ ,diff:-
highlight VertSplit ctermbg=6 ctermfg=0 guibg=cyan guifg=cyan
highlight EndOfBuffer ctermfg=bg guifg=bg
highlight Folded ctermfg=grey guifg=grey cterm=NONE gui=NONE
" GUI related options
set guifont=LiterationMonoPowerline:h14
set linespace=8
set guioptions=
" Large File related options
let g:LargeFile = 1000
" Airline related options
let AirlineTheme="iceberg"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
set updatetime=100
" gitgutter changes here
set signcolumn=yes 
" nerd tree commands here
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
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
command -nargs=1 Dp vert term python3 -m pdb <args>
command -nargs=1 Vr vert rightbelow sb <args>
command -nargs=1 Vl vert leftabove sb <args>
command Gglt GitGutterLineHighlightsToggle
command Ggs GitGutterLineHighlightsEnable | GitGutterFold
command Ggh GitGutterLineHighlightsDisable | GitGutterFold
command W w
command Q q
" custom keymaps go here
let mapleader=","
map <leader>o :NERDTreeToggle<CR>
map <leader>l :ls<CR>:b
let g:ctrlp_cmd = 'CtrlPMixed'
" Lint related options
let g:ale_verilog_vlog_options='-quiet -lint -sv -sv12compat'
let g:ale_linters_explicit=1
let g:ale_set_balloons=1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_set_quickfix = 1
" let g:ale_completion_enabled = 1
let g:ale_linters = {"c":["cc"], "cpp":["cc"], "python":["pylint"]}
let g:ale_c_cc_executable = '/local/tools/installs/oss/gcc/9.4.0/bin/gcc'
let g:ale_cpp_cc_executable = '/local/tools/installs/oss/gcc/9.4.0/bin/gcc'
let g:ale_c_cc_options = '-Wall -I../../../include/defines -I../../../apis/common -I../../../apis/sysapi -I../../../include/spec/cfg0 -I../../../include/defines -I../../../apis/common -I../../../apis/sysapi -I../../../include/spec/cfg0 -std=c99 -fPIC -DIS_HOST=1'
let g:ale_cpp_cc_options = '-I../../../include/defines -I../../../apis/common -I../../../apis/sysapi -I../../../include/spec/cfg0 -I../../../include/defines -I../../../apis/common -I../../../apis/sysapi -I../../../include/spec/cfg0 -fPIC -DIS_HOST=1'
let g:ale_c_parse_makefile = 1
