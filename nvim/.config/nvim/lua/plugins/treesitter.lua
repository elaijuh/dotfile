return {
  {
    "nvim-treesitter/nvim-treesitter",
    ft = { "sh", "go", "c", "cpp", "lua", "javascript", "python" },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = { "bash", "go", "c", "cpp", "lua", "javascript" },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
