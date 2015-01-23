if has('win32') || has ('win64')
    let $VIMBUNDLE = $HOME."/vimfiles/bundle"    " Use the system's clipboard as the default register
    set clipboard=unnamed
    set guifont=Consolas
else
    let $VIMBUNDLE = $HOME."/.vim/bundle"
    set clipboard=unnamedplus
endif

filetype plugin off

if has('vim_starting')
    set nocompatible               " Be iMproved
    let $NEOBUNDLEHOME = $VIMBUNDLE."/neobundle.vim"
    set runtimepath+=$NEOBUNDLEHOME
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" ReST documentation plugin
NeoBundle 'Rykka/riv.vim'

" Git plugins
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'int3/vim-extradite' " Extend fugitive capabilities

" Bars, panels and files
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'

" Text manipulation
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/Gundo'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'godlygeek/tabular'

" Different Syntax Types in the same file
NeoBundle 'vim-scripts/SyntaxRange'

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
NeoBundle 'jgdavey/tslime.vim' "Send snippets to tmux
NeoBundle 'ervandew/supertab'  "Do all your text insertion with TAB
NeoBundle 'majutsushi/tagbar' 
NeoBundle 'derekwyatt/vim-scala'

" Haskell
NeoBundle 'raichoo/haskell-vim'
NeoBundle 'begriffs/vim-haskellConceal'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'Twinside/vim-hoogle'

NeoBundleLazy 'mattn/calendar-vim.git'
NeoBundleLazy 'chrisbra/NrrwRgn'
NeoBundle 'hsitz/VimOrganizer.git', {'autoload': {'filetypes' : 'org'}}
NeoBundleLazy 'dhruvasagar/vim-table-mode.git'
NeoBundleLazy 'Shougo/vimshell.git'

NeoBundleLazy 'mitechie/pyflakes-pathogen.git'

NeoBundleCheck

filetype plugin indent on     " Required!

" Shortcuts
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTree<CR>

set textwidth=80

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

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
else
    set number
endif

set pastetoggle=<F2>


" Syntastic configuraiton
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

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

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Height of the command bar
set cmdheight=1

" Task lists
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

" Syntaxing
syntax on                           " syntax highlighing

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
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.asciidoc set spell tw=80
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

" " Alignment {{{

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1

" }}}

" Slime {{{

vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars

" }}}

" Haskell {{{ 
let g:haddock_browser="/usr/bin/firefox"
set iskeyword=a-z,A-Z,_,.,39 " Configuration for hoshasktags

set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update<CR>:call system("git hscope")<CR><CR>:call LoadHscope()<CR>

map <leader>tt :TagbarToggle<CR>

set csprg=hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()

" }}}

" Haskell Interrogation {{{

set completeopt+=longest

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" But provide (neco-ghc) omnicompletion
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>
" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

" }}}

" Conversion {{{

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

" }}}


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

