"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Jeth's vim configuration file
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

filetype off " required

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugins Configuration
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugged - plugin manager
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
call plug#begin() "Specify a directory for plugins

"Plugins for Colorscheme
Plug 'junegunn/seoul256.vim' "seoul256
Plug 'arcticicestudio/nord-vim' "nord
Plug 'jacoborus/tender.vim' "tender
Plug 'trusktr/seti.vim' "seti

" Plugins for Developing"
Plug 'tpope/vim-sensible' "sensible options for vim
Plug 'wincent/terminus' "enhanced terminal integration for vim
Plug 'dense-analysis/ale' "syntax checking & semantic errors
Plug 'preservim/nerdtree' "file system explorer
Plug 'frazrepo/vim-rainbow' "rainbow brackets
Plug 'preservim/nerdcommenter' "comment function
"Plug 'itchyny/lightline.vim' "statusline
Plug 'vim-airline/vim-airline' "cooler status line
Plug 'vim-airline/vim-airline-themes' "themes for airline
Plug 'tpope/vim-fugitive' "git plugin for vim
Plug 'jiangmiao/auto-pairs' "auto pairing for brackets
Plug 'mileszs/ack.vim' "search tool
Plug 'ctrlpvim/ctrlp.vim' "fuzzy file finder
Plug 'sheerun/vim-polyglot' "language packs for vim
Plug 'tpope/vim-surround' "edits surroundings(brackets, quotes) in pairs
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "multiple cursors
Plug 'airblade/vim-gitgutter' "shows changes from git
Plug 'yegappan/taglist' "shows code structure 
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } "make vim look better for certain file types
Plug 'pechorin/any-jump.vim' "Vim code inspection for definiton
Plug 'rrethy/vim-illuminate' "Highlight other uses of the current word
Plug 'neoclide/coc.nvim',{'branch': 'release'} "Code completion
Plug 'goerz/jupytext.vim' "open Jupyter notebooks in vim
Plug 'jalvesaq/Nvim-R', {'branch': 'master'} "practically turn Vim into an R IDE

" Plugins for Writing
Plug 'junegunn/goyo.vim' "deletes distractions
Plug 'junegunn/limelight.vim' "deletes distractions
Plug 'rhysd/vim-grammarous' "grammar checker
Plug 'reedes/vim-pencil' "sensible options for writing
Plug 'reedes/vim-wordy' "uncover word usage problems in writing
Plug 'reedes/vim-litecorrect' "autocorrect
Plug 'reedes/vim-lexical' "spellchecker + thesaurus
Plug 'lervag/vimtex', {'tag': 'v1.6'} "vim plugin for LaTeX
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " conceal for LaTeX
call plug#end() " Initialize plugin system

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Configuration of Coding Plugins
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" CoC Configuration
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><ENTER> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" NERDTree Configuration
nmap <C-m> :NERDTreeToggle<CR> 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" use control-m to toggle nerd tree

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close Vim if NERDTree is the last tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" TagList Configuration
nmap <C-t> :TlistToggle<CR> 
" use control-t to toggle Tag list
let g:Tlist_Exit_OnlyWindow=1

" CtrlP Configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" use control-p to toggle fuzzy finder

" Molokai colorscheme Configuration
let g:rehash256 = 1

" airline theme
let g:airline_theme = 'tender'

" Vim Rainbow Configuration
let g:rainbow_active = 1 " enable raibow brackets across all filetypes

"vim pencil config
let g:pencil#wrapModeDefault='soft' " set default wrap mode to soft


"Jupyter 
let g:jupytext_fmt='py:percent' " specifies what format to convert ipynb too 

"vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=2
let g:tex_conceal='abdgm'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Filetype Initialisation
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup pencil "set up pencil when opening text files
    autocmd!
    autocmd FileType markdown,mkd,text,tex call pencil#init()
                                   \ | call litecorrect#init()
                                   \ | call lexical#init()
augroup END
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Basic Vim Configuration
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Files
set hidden "hides current file instead of closing when there's no save

" Searching
set hlsearch " highlight matches
set ignorecase " ignore case when searching
set smartcase " ignore case but not the entire time :)
 
" Indentation
set autoindent
filetype indent on "load filetype-specific indent files

" Menubar
set wildmenu " visual autocomplete for command menu
set showmatch "highlight matching brackets
set number " show line numbers
set relativenumber "show distance from current line
set cursorline "highlight current line
set laststatus=2 "show the status line permanently

" Set Indentation
set shiftwidth=4 "2 space characters for indentation
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set tabstop=4 " number of visual spaces per TAB

" Color
set termguicolors
set background=dark
colorscheme nord

"Miscellaneous
"set spell spelllang=en_us
set clipboard+=unnamedplus "copy stuff to system clipboard
let mapleader=" " "map leader key to space bar
set scrolloff=10
set encoding=utf8
hi clear Conceal

