set tabstop=2
set shiftwidth=2
set expandtab

autocmd BufWritePre *.c :lua vim.lsp.buf.format()
