if has('win32') || has ('win64')
    let $VIMBUNDLE = $HOME."/vimfiles/bundle"
else
    let $VIMBUNDLE = $HOME."/.vim/bundle"
endif

filetype plugin off

if has('vim_starting')
    set nocompatible               " Be iMproved
    let $NEOBUNDLEHOME = $VIMBUNDLE."/neobundle.vim"
    set runtimepath^=$NEOBUNDLEHOME
endif

call neobundle#rc(expand($VIMBUNDLE))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Rykka/riv.vim'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'msanders/snipmate.vim.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-scripts/The-NERD-tree.git'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'techlivezheng/vim-plugin-minibufexpl'
NeoBundle 'Shougo/vimproc',{
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'majutsushi/tagbar' 

NeoBundleLazy 'mattn/calendar-vim.git'
NeoBundleLazy 'chrisbra/NrrwRgn'
NeoBundleLazy 'hsitz/VimOrganizer.git'
NeoBundleLazy 'dhruvasagar/vim-table-mode.git'
NeoBundleLazy 'Shougo/vimshell.git'

NeoBundleLazy 'mitechie/pyflakes-pathogen.git'

NeoBundleLazy 'lukerandall/haskellmode-vim.git', {'autoload' : {'filetypes' : 'haskell'}}
NeoBundleLazy 'ujihisa/neco-ghc.git', {'autoload' : {'filetypes' : 'haskell'}}
NeoBundleLazy 'hsitz/VimOrganizer', {'autoload' : {'filetypes' : 'org'}}

NeoBundleCheck

filetype plugin indent on     " Required!

" Shortcuts
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTree<CR>

set textwidth=80

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

if has('win32') || has ('win64')
    set guifont=Consolas
endif

" Automatically change to current directory
set autochdir

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set ttyfast
set ruler
set autoindent

" Numbering
if v:version > 702
    set relativenumber
endif

set pastetoggle=<F2>
" Use the system's clipboard as the default register
set clipboard=unnamedplus

" Syntastic configuraiton
let g:syntastic_always_populate_loc_list=1

" I want searching to follow regex rules
nnoremap / /\v
vnoremap / /\v
set incsearch
set showmatch
set hlsearch

" Colors
set t_Co=16 " Necesary for terminator
set background=dark
colorscheme solarized

" Folding
set foldmethod=indent
set foldlevel=99

" Window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Don't use arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Change mapleader to an easier to reach key
let mapleader = ","
let maplocalleader = "_"

" Task lists
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

" Syntaxing
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
filetype plugin on

" Deal with tabs
set expandtab
set list
set listchars=tab:→\ 
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Different filesyntax
au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
au BufRead,BufNewFile *.nw  set filetype=noweb
au BufRead,BufNewFile *.nw  set cindent
au BufRead,BufNewFile *.asciidoc set spell tw=80
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
au BufEnter *.hs compiler ghc

" Haskell
let g:haddock_browser="/usr/bin/firefox"
set iskeyword=a-z,A-Z,_,.,39 " Configuration for hoshasktags

" Latex
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Pyflakes
let g:pyflakes_use_quickfix = 0

" Pep 8
let g:pep8_map='<leader>8'

" Git
set statusline=%{fugitive#statusline()}

" Tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" File NERD
map <leader>n :NERDTreeToggle<CR>

" Refactoring
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching
nmap <leader>a <Esc>:Ack!

" Macros
" Aucomment this line and create a copy below
autocmd FileType c,cpp,java,scala let @c='yypk^i// '
autocmd FileType sh,ruby,python   let @c='yypk^i# '
autocmd FileType conf,fstab       let @c='yypk^i# '
autocmd FileType tex              let @c='yypk^i% '
autocmd FileType mail             let @c='yypk^i> '
autocmd FileType vim              let @c='yypk^i" '

" Unite menus
let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
" }}}

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" file searching menu {{{
let g:unite_source_menu_menus.grep = {
    \ 'description' : ' search files
        \ ⌘ [space]a',
    \}
let g:unite_source_menu_menus.grep.command_candidates = [
    \['▷ grep (ag → ack → grep) ⌘ ,a',
        \'Unite -no-quit grep'],
    \['▷ find',
        \'Unite find'],
    \['▷ locate',
        \'Unite -start-insert locate'],
    \['▷ vimgrep (very slow)',
        \'Unite vimgrep'],
    \]
nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>

" Haskell menu {{{
let g:unite_source_menu_menus.haskell = {
    \ 'description' : ' haskell commands
        \ ⌘ [space]h',
    \}
let g:unite_source_menu_menus.haskell.command_candidates = [
    \['▷ create tags ⌘ ,_ct',
        \'[menu]ct'],
    \]
" }}}
nnoremap <silent>[menu]h :Unite -silent menu:haskell<CR>

" |_ct|                 create |tags| file 
" |_si|                 show info for id under cursor
" |_t|                  show type for id under cursor
" |_T|                  insert type declaration for id under cursor
" Include local configuration
if filereadable(expand("~/.vim.local"))
	so ~/.vim.local
endif

