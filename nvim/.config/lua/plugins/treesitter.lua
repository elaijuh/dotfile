return {
  {
    "nvim-treesitter/nvim-treesitter",
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

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 1
      vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
        pattern = { "*" },
        command = "normal zR",
      })
    end,
  },
}
