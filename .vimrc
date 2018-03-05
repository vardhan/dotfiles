"plugins:
"   ctrlp (https://github.com/kien/ctrlp.vim)
"   syntastic (https://github.com/scrooloose/syntastic)

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
    colors xoria256
endif

set autoread "reload files changed outside vim
set number "line numbers
set showmatch "show matching braces
syntax enable
set ai "set autoindent
set smartindent "set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=80

set incsearch
set hlsearch

" split
map 2 :sp<CR>
map 3 :vsp<CR>

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

" page up/page down
inoremap <C-b> <Esc><C-b>i
inoremap <C-f> <Esc><C-f>i

" we already have Alt+v for this:
" imap vv <ESC>v
map qq <Esc>:q<CR>
map ww <ESC>:w!<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" ctags and related
set tags=tags;/ " keep going up a dir until you find a tags file
filetype plugin indent on

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_by_filename = 1

" vim-powerline:
set laststatus=2

let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

autocmd BufNewFile,BufRead *.tmpl setf jinja
