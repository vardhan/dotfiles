set autoread "reload files changed outside vim
set number "line numbers
set showmatch "show matching braces
syntax enable
set ai "set autoindent
set smartindent
set tabstop=4
set expandtab

" delete word
imap <Esc><BS> <C-W>
map <Esc><BS> i<C-W><Esc>

" undo
imap <C-_> <Esc>ui
map <C-_> u

" beginning/end of line
imap <C-a> <Esc>^i
imap <C-e> <Esc><S-a>
map <C-e> <Esc>$
map <C-a> <Esc>^
vmap <C-e> $
vmap <C-a> ^

" beginning/end of word
map <C-l> <Esc>E
map <C-h> <Esc>B

" we already have Alt+v for this:
" imap vv <ESC>v

map qq <Esc>:q<CR>
map ww <ESC>:w!<CR>


