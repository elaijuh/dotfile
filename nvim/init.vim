set nocompatible
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set colorcolumn=80
set cursorline
set autoindent
syntax on

if has('termguicolors')
	set termguicolors
end
set background=light
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

let mapleader=","

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" nvim-tree
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>f :NvimTreeFindFile<cr>

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-r> :Buffers<cr>

" treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1

runtime vim.lua


