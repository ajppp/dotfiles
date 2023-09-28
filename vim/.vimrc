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
Plug 'ajmwagar/vim-deus' "vim-deus

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
Plug 'neoclide/coc.nvim',{'branch': 'release'} "Code completion - needs a certain version of Vim so uncomment this line only if your Vim version supports it
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
set t_Co=256
set termguicolors "not always available so uncomment it when it is available
set background=dark
colorscheme deus
let g:deus_termcolors=256

"Miscellaneous
"set spell spelllang=en_us
set clipboard+=unnamed "copy stuff to system clipboard
let mapleader=" " "map leader key to space bar
set scrolloff=25
set encoding=utf8

"autocmd vimenter *.md Goyo
"autocmd vimenter *.md Limelight

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Configuration of Coding Plugins
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"~~~~~~~~~~~~~~~~~~~~~
"Coc.nvim
"~~~~~~~~~~~~~~~~~~~~~

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
let g:airline_theme = 'deus'

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
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=1
let g:tex_conceal = 'abdmg'

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

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

"~~~~~~~~~~~~~~~~~~~~~
"fzf-preview
"~~~~~~~~~~~~~~~~~~~~~

"spacebar-f to start fzf-preview
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
