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
set cmdwinheight=1
set splitbelow
colo slate
syntax on
filetype plugin indent on


inoremap jk <esc>
inoremap <esc><BS> <C-w>
noremap <leader>y :w !pbcopy<CR>
nnoremap q: <nop>
nnoremap : :<C-f>i
nnoremap gx yiW:silent !open <cWORD><CR>:redraw!<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


augroup notes
    au!
    au FileType text
                \   setlocal textwidth=78 ft=help nonumber
                \ | nnoremap <leader>. :w<CR>:helptags %:p:h<CR>
augroup END

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
    au FileType python nnoremap <leader>. :call Run("python3 " . expand("%"))<CR>
    au FileType c      nnoremap <leader>. :call Run("gcc " . expand("%") . " && ./a.out")<CR>
    au FileType vim    nnoremap <leader>. :w<CR>:source $MYVIMRC<CR>
    au FileType zsh    nnoremap <leader>. :w<CR>:!source %<CR>
augroup END
