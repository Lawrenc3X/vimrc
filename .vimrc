set nocp
set backspace=indent,eol,start
set mouse=a
set ruler
set number
set belloff=all
set tabstop=4
set shiftwidth=4
set expandtab
set whichwrap+=<,>,[,]
set splitbelow
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set guioptions=
set nowrap
colo desert-night
syntax on
filetype plugin indent on
autocmd TerminalOpen * setlocal nonumber norelativenumber
autocmd Filetype * setlocal omnifunc=syntaxcomplete#Complete
let g:netrw_banner=0


set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1


inoremap jk <esc>
noremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>
cnoremap <F4> <C-c>:set list!<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


augroup w3settings
    au!
    au FileType html,css,scss,javascript setlocal tabstop=2 shiftwidth=2
augroup END

function Run(cmd)
    write
    if winnr("$") == 1
        let t:buf = term_start("zsh", {"term_finish": "close"})
    endif
    call term_sendkeys(t:buf, a:cmd . "\<CR>")
    wincmd j
endfunction

augroup CCrun
    au!
    au FileType python nnoremap <buffer> <leader>. :call Run("python3 " . expand("%"))<CR>
    au FileType java   nnoremap <buffer> <leader>. :call Run("javac " . expand("%") . " && java " . expand("%:r"))<CR>
    au FileType cpp    nnoremap <buffer> <leader>. :call Run("g++ " . expand("%") . " && ./a.out")<CR>
    au FileType vim    nnoremap <buffer> <leader>. :w<CR>:source $MYVIMRC<CR>
    au FileType zsh    nnoremap <buffer> <leader>. :w<CR>:!source %<CR>
augroup END
