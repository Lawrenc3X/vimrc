set nocp

set backspace=indent,eol,start

set number
set mouse=a
colo default 
syntax on

set foldmethod=indent
set foldlevel=99

" mappings
" normal mode shortcut
inoremap jk <esc>

" run shortcut
noremap runfile <nop>
autocmd FileType python noremap runfile :w<CR>:!python3 %<ENTER>
autocmd FileType ruby   noremap runfile :w<CR>:!ruby %<ENTER>
autocmd FileType cpp    noremap runfile :w<CR>:!make clean<CR>:!make %:r<ENTER><ENTER>:!./%:r
autocmd FileType c      noremap runfile :w<CR>:!make clean<CR>:!make %:r<ENTER><ENTER>:!./%:r
autocmd FileType java   noremap runfile :w<CR>:!javac %<ENTER><ENTER>:!java %:r<CR>
nmap .. runfile
" imap .. <c-o>runkey

" comment block shortcut
noremap comment <nop>
autocmd FileType python noremap comment :norm i# <CR>  
autocmd FileType ruby   noremap comment :norm i# <CR>  
autocmd FileType cpp    noremap comment :norm i// <CR>
autocmd FileType c      noremap comment :norm i// <CR>
autocmd FileType java   noremap comment :norm i// <CR>
autocmd FileType vim    noremap comment :norm i" <CR>
vmap + comment 

" uncomment block shortcut
noremap uncomment <nop>
autocmd FileType python noremap uncomment :norm ^2x<CR>
autocmd FileType ruby noremap uncomment :norm ^2x<CR>
autocmd FileType cpp    noremap uncomment :norm ^3x<CR>
autocmd FileType c      noremap uncomment :norm ^3x<CR> 
autocmd FileType java   noremap uncomment :norm ^3x<CR>
autocmd FileType vim    noremap uncomment :norm ^2x<CR>
vmap _ uncomment

" copy file shortcut
noremap copyall :%w !pbcopy<ENTER><ENTER>
nmap yy copyall 
" imap yy <c-o>copyall

" tab magic:
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
