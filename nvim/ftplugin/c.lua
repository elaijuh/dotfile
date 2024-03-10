vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "silent! lua vim.lsp.buf.format()"
})
