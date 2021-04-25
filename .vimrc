set nocp
set backspace=indent,eol,start
set mouse=a
set number          " cosider setting relativenumber too
set belloff=all
colo slate 
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
noremap <leader>y :w !pbcopy<CR>

" from :help ins-completion
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

inoremap <S-Tab> <C-X><C-O> 

" -- AUTOCOMMANDS --

augroup runfile
    au!
    au FileType ruby   nnoremap <leader>. :w<CR>:!ruby %<CR>
    au FileType python nnoremap <leader>. :w<CR>:!python3 %<CR>
    au FileType java   nnoremap <leader>. :w<CR>:!javac % && java %:r<CR>
    au FileType cpp    nnoremap <leader>. :w<CR>:!g++ -std=c++11 -o out.%:r % && ./out.%:r<CR>
    au FileType c      nnoremap <leader>. :w<CR>:!gcc -o out.%:r % && ./out.%:r<CR>
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
