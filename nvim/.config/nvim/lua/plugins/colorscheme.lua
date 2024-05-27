return {
  {
    "morhetz/gruvbox",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
      vim.opt.background = "light"
			vim.cmd([[colorscheme gruvbox]])
    end
  }
}
