set tabstop=4
set shiftwidth=4

autocmd BufWritePre *.c :lua vim.lsp.buf.format()
