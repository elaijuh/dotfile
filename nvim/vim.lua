-- common
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.colorcolumn = '100'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = ','

-- colorscheme
-- vim.g.seoul256_background = 253
-- vim.cmd [[colorscheme seoul256]]
vim.opt.background = 'light'
-- vim.cmd [[colorscheme kanagawa]]
vim.cmd [[colorscheme paper]]

-- keymap
vim.keymap.set('n', '[b', ':bprevious<cr>', {remap = false, silent = true})
vim.keymap.set('n', ']b', ':bprevious<cr>', {remap = false, silent = true})
vim.keymap.set('n', '<C-h>', '<C-w>h', {remap = false})
vim.keymap.set('n', '<C-l>', '<C-w>l', {remap = false})
vim.keymap.set('n', '<C-j>', '<C-w>j', {remap = false})
vim.keymap.set('n', '<C-k>', '<C-w>k', {remap = false})

vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<cr>', {remap = false})
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', {remap = false})

-- autocmd
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*"},
  command = "silent! lcd %:p:h"
})


vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", {})

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always',
    header = '',
    prefix = ''
  },
})

local border = {
      {"/", "FloatBorder"},
      {"-", "FloatBorder"},
      {"\\", "FloatBorder"},
      {"|", "FloatBorder"}
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  -- also you can override some options like
  -- opts.wrap = false or opts.border .something else
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


require("nvim-tree-conf")
require("nvim-treesitter-conf")
require("fzf-conf")
require("nvim-cmp-conf")
require("nvim-lspconfig-conf")
require("gitsigns-conf")
require("venn-conf")

