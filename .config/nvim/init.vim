"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/hjl/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/hjl/.cache/dein')
  call dein#begin('/Users/hjl/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/hjl/.cache/dein/repos/github.com/Shougo/dein.vim')

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
