filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Automatically change to current directory
set autochdir

" Colors
set t_Co=16 " Necesary for terminator
set background=dark
colorscheme solarized

" Numbering
set nu

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

" Task lists
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

" Syntaxing
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
filetype plugin on
set expandtab
set tabstop=4
set shiftwidth=4

" Different filesyntax
au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
au BufRead,BufNewFile *.nw  set filetype=noweb
au BufRead,BufNewFile *.nw  set cindent
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()


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

