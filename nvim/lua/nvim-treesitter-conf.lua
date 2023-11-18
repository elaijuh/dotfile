require("nvim-treesitter.configs").setup({
  ensure_installed = {"bash", "go", "c", "cpp", "lua", "javascript"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
