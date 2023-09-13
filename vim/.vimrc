"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Jeth's vim configuration file
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" required
set nocompatible " be iMproved
filetype off " required

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugins Configuration
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugged - plugin manager
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Automatic Installation for Plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.vim/plugged') "Specify a directory for plugins

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'itchyny/lightline.vim' "statusline
Plug 'vim-airline/vim-airline' "cooler status line
Plug 'vim-airline/vim-airline-themes' "themes for airline
Plug 'tpope/vim-fugitive' "git plugin for vim
Plug 'jiangmiao/auto-pairs' "auto pairing for brackets
Plug 'mileszs/ack.vim' "search tool
Plug 'ctrlpvim/ctrlp.vim' "fuzzy file finder
Plug 'sheerun/vim-polyglot' "language packs for vim
Plug 'tpope/vim-surround' "edits surroundings(brackets, quotes) in pairs
Plug 'MortenStabenau/matlab-vim'
"Plug 'mg979/vim-visual-multi', {'branch': 'master'} "multiple cursors
Plug 'airblade/vim-gitgutter' "shows changes from git
"Plug 'yegappan/taglist' "shows code structure 
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } "make vim look better for certain file types
"Plug 'pechorin/any-jump.vim' "Vim code inspection for definiton
Plug 'rrethy/vim-illuminate' "Highlight other uses of the current word
"Plug 'neoclide/coc.nvim',{'branch': 'release'} "Code completion - needs a certain version of Vim so uncomment this line only if your Vim version supports it
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
Plug 'lervag/vimtex' " vim plugin for LaTeX
Plug 'dracula/vim', { 'as': 'dracula' }

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
" use control-m to toggle nerd tree

" TagList Configuration
nmap <C-t> :TlistToggle<CR> 
" use control-t to toggle Tag list

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
let g:pencil#wrapModeDefault = 'soft' " set default wrap mode to soft

"OceanicNext bold and italic
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1

"Jupyter 
let g:jupytext_fmt = 'py:percent' " specifies what format to convert ipynb too 

"vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=1
let g:tex_conceal = 'abdmg'

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Filetype Initialisation
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup pencil "set up pencil when opening text files
    autocmd!
    autocmd FileType markdown,mkd,text call pencil#init()
                                   \ | call litecorrect#init()
                                   \ | call lexical#init()
augroup END
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Basic Vim Configuration
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Files
set hidden "hides current file instead of closing when there's no save
filetype plugin on
syntax enable " enable syntax processing

" Searching
set incsearch " search as characters are entered
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
set showcmd " show command in bottom bar
set cursorline "highlight current line
set laststatus=2 "show the status line permanently

" Set Indentation
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

" Color
set termguicolors "not always available so uncomment it when it is available
set background=dark
colorscheme dracula

"Miscellaneous
"set spell spelllang=en_us
set clipboard+=unnamed "copy stuff to system clipboard
let mapleader=" " "map leader key to space bar
set scrolloff=25
set encoding=utf8

autocmd vimenter *.md Goyo
autocmd vimenter *.md Limelight

