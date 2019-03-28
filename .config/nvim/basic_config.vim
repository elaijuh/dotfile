let mapleader = ","

set encoding=utf8
set termguicolors
set background=light
colorscheme acme
"colorscheme nofrils-acme
set autoread
set expandtab
set smarttab
set ruler
set nu
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap
set ignorecase
set smartcase
set gfn=Fira\ Code:h13,Hasklig:h13,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15

inoremap jk <esc>
nmap <leader>w :w!<cr>
map <space> /
map <silent> <leader><cr> :noh<cr>

""" windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <silent><Leader>1 :exe "resize +10"<CR>
nnoremap <silent><Leader>2 :exe "resize -10"<CR>
nnoremap <silent><Leader>3 :exe "vertical resize +10"<CR>
nnoremap <silent><Leader>4 :exe "vertical resize -10"<CR>

""" tab
noremap ¡ :tabprevious<CR>
noremap ™ :tabnext<CR>


""" buffer
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>

""" misc
vmap <leader>y "*y



""" indent
au FileType html setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType vue,javascript,json,typescript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType tf setl tabstop=2 expandtab shiftwidth=2 softtabstop=2


""" Helper functions

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
