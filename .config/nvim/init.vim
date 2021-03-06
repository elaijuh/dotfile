"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('nixprime/cpsm')
  call dein#add('Shougo/neomru.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('w0rp/ale')
  call dein#add('pangloss/vim-javascript')
  call dein#add('posva/vim-vue')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('fatih/vim-go')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

source ~/.config/nvim/basic_config.vim
source ~/.config/nvim/plugins_config.vim
