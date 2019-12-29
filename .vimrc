set nocp

set number
set mouse=a
colo blue
syntax on

" mappings
" normal mode shortcut
inoremap jk <esc>
inoremap jl <esc>:
nnoremap jl :

" run shortcut
noremap runfile <nop>
autocmd FileType python noremap runfile :w<ENTER>:!python3 %<ENTER>
autocmd FileType cpp    noremap runfile :w<ENTER>:!g++ -g %<ENTER><ENTER>:!./a.out<ENTER>
autocmd FileType java   noremap runfile :w<ENTER>:!javac %<ENTER><ENTER>:!java %:r<ENTER>
nmap .. runfile
" imap .. <c-o>runkey

" comment block shortcut
noremap comment <nop>
autocmd FileType python noremap comment :norm i# <ENTER>  
autocmd FileType ruby   noremap comment :norm i# <ENTER>  
autocmd FileType cpp    noremap comment :norm i// <ENTER>
autocmd FileType java   noremap comment :norm i// <ENTER>
autocmd FileType vim    noremap comment :norm i" <ENTER>
vmap + comment 

" uncomment block shortcut
noremap uncomment <nop>
autocmd FileType python noremap uncomment :norm ^2x<ENTER>
autocmd FileType ruby noremap uncomment :norm ^2x<ENTER>
autocmd FileType cpp    noremap uncomment :norm ^3x<ENTER>
autocmd FileType java   noremap uncomment :norm ^3x<ENTER>
autocmd FileType vim    noremap uncomment :norm ^2x<ENTER>
vmap _ uncomment

" copy file shortcut
noremap copyall :%w !pbcopy<ENTER><ENTER>
nmap yy copyall 
" imap yy <c-o>copyall

" paste vim clipbord with \v in insert mode
inoremap <leader>v <c-o>p

" tab magic:
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
