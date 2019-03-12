""""""""""""""""""""""""""""""""
" => deoplete
""""""""""""""""""""""""""""""""
call deoplete#enable()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""""""""""""""""""""""""
" => defx
""""""""""""""""""""""""""""""""
call deoplete#enable()

map <leader>nn :Defx -toggle -split=vertical -winwidth=50 -direction=botright<cr>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open_directory')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> i
  \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('drop', 'tabnew')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction


""""""""""""""""""""""""""""""""
" => denite
""""""""""""""""""""""""""""""""
map <leader>f :Denite file/rec<cr>
map <leader>o :Denite file_mru<cr>
map <leader>b :Denite buffer<cr>
map <leader>g :Denite grep<cr>
map <c-r> :Denite command_history<cr>

if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--no-heading'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

" Change mappings.
call denite#custom#map(
	\ 'insert',
	\ '<C-j>',
	\ '<denite:move_to_next_line>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-k>',
	\ '<denite:move_to_previous_line>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-u>',
	\ '<denite:scroll_page_backwards>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-d>',
	\ '<denite:scroll_page_forwards>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-s>',
	\ '<denite:do_action:vsplit>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-i>',
	\ '<denite:do_action:split>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-t>',
	\ '<denite:do_action:tabopen>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-x>',
	\ '<denite:do_action:delete>',
	\ 'noremap'
	\)
" Change matchers.
call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/cpsm'])
" Change default prompt
call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')


""""""""""""""""""""""""""""""""
" => lightline
""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme': 'landscape'
    \}

""""""""""""""""""""""""""""""""
" => vim-vue
""""""""""""""""""""""""""""""""
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1


""""""""""""""""""""""""""""""""
" => ale
""""""""""""""""""""""""""""""""
let g:ale_completion_enabled = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['prettier'],
    \ 'vue': ['prettier'],
    \ 'css': ['prettier']
    \ }
" let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'vue': ['eslint']
    \ }
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
