set nocp
set backspace=indent,eol,start
set mouse=a
set number          " cosider setting relativenumber too
colo default 
syntax on

" tab magic:
filetype plugin indent on
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " on pressing tab, insert 4 spaces

" -- MAPPINGS --

" normal mode shortcut
inoremap jk <esc>

" copy file shortcut, file is saved then passed as an argument to pbcopy
noremap <leader>y :w !pbcopy<CR><CR>

" map right mouse button to toggle insert mode
nnoremap <RightMouse> <LeftMouse>i
inoremap <RightMouse> <LeftMouse><esc>

" -- AUTOCOMMANDS --

augroup runfile
    au!
    au FileType ruby   nnoremap <leader>. :w<CR>:!ruby %<CR>
    au FileType python nnoremap <leader>. :w<CR>:!python3 %<CR>
    au FileType java   nnoremap <leader>. :w<CR>:!javac %<CR><CR>:!java -ea %:r<CR>
    au FileType cpp    nnoremap <leader>. :w<CR>:!make clean<CR>:!make %:r<CR><CR>:!./%:r
    au FileType c      nnoremap <leader>. :w<CR>:!make clean<CR>:!make %:r<CR><CR>:!./%:r
augroup END

augroup comment
    au!
    au FileType python vnoremap + :norm i# <CR>  
    au FileType ruby   vnoremap + :norm i# <CR>  
    au FileType cpp    vnoremap + :norm i// <CR>
    au FileType c      vnoremap + :norm i// <CR>
    au FileType java   vnoremap + :norm i// <CR>
    au FileType vim    vnoremap + :norm i" <CR>
augroup END

augroup uncomment
    au!
    au FileType python vnoremap _ :norm ^2x<CR>
    au FileType ruby   vnoremap _ :norm ^2x<CR>
    au FileType cpp    vnoremap _ :norm ^3x<CR>
    au FileType c      vnoremap _ :norm ^3x<CR> 
    au FileType java   vnoremap _ :norm ^3x<CR>
    au FileType vim    vnoremap _ :norm ^2x<CR>
augroup END
