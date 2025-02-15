vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "100"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↴" }
vim.opt.inccommand = "split"
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.tabline = "%!expand('%:p:h')"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = false

-- [[ autocmd ]]
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = "silent! lcd %:p:h",
})

-- [[ preview window ]]
--
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", {})

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = "always",
    header = "",
    prefix = "",
  },
})

local border = {
  { "/", "FloatBorder" },
  { "-", "FloatBorder" },
  { "\\", "FloatBorder" },
  { "|", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  -- also you can override some options like
  -- opts.wrap = false or opts.border .something else
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
