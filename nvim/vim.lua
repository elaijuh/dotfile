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

