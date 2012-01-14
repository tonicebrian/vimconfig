filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Folding
set foldmethod=indent
set foldlevel=99

" Window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Task lists
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

" Syntaxing
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
set expandtab
set tabstop=4
set shiftwidth=4

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
