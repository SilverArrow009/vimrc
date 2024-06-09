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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
set encoding=utf-8
" Some language servers have issues with backup files, see #649
set nobackup
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
" vim-ultisnips related keybindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" coc.nvim related keybindings
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
