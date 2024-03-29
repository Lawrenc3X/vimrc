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
" set splitbelow
set splitright
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set guioptions=
set nowrap
set lines=24 columns=80
" set guifont=Menlo-Regular:h14
set guifont=Comic\ Mono:h15
set autochdir
colo desert-night
syntax on
filetype plugin indent on
autocmd TerminalOpen * setlocal nonumber norelativenumber
autocmd Filetype * setlocal omnifunc=syntaxcomplete#Complete
let g:netrw_banner=0
let g:netrw_liststyle = 3


set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1


inoremap jk <esc>
vnoremap jk <esc>
inoremap <S-Right> <C-o>v<Right>
inoremap <S-Left> <C-o>v<Left>
inoremap <S-Up> <C-o>v<Up>
inoremap <S-Down> <C-o>v<Down>
vnoremap <BS> x

noremap <S-Up> <Up>
noremap <S-Down> <Down>

noremap <leader>l :set list!<CR>
nnoremap <leader>p :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


augroup w3settings
    au!
    au FileType html,css,scss,javascript setlocal tabstop=2 shiftwidth=2
augroup END

function OpenTerm()
    let t:buf = term_start("zsh", {"term_finish": "close", "vertical": v:true})
endfunction

function Run(cmd)
    write
    if winnr("$") == 1
        call OpenTerm()
    endif
    call term_sendkeys(t:buf, a:cmd . "\<CR>")
    wincmd l
    " ^ needed because only term_start switches focus
endfunction

nnoremap <leader>. :call OpenTerm()<CR>
augroup CCrun
    au!
    au FileType python nnoremap <buffer> <leader>. :call Run("python3 " . expand("%"))<CR>
    au FileType java   nnoremap <buffer> <leader>. :call Run("javac " . expand("%") . " && java " . expand("%:r"))<CR>
    au FileType cpp    nnoremap <buffer> <leader>. :call Run("g++ " . expand("%") . " && ./a.out")<CR>
    au FileType c      nnoremap <buffer> <leader>. :call Run("gcc " . expand("%") . " && ./a.out")<CR>
    au FileType vim    nnoremap <buffer> <leader>. :w<CR>:source $MYVIMRC<CR>
    au FileType zsh    nnoremap <buffer> <leader>. :call Run("source ~/.zshrc")<CR>
augroup END
