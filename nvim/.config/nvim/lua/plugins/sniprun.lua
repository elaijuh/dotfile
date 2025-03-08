return {
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh 1",
    config = function()
      require("sniprun").setup({
        display = {
          "Classic",
        },
        interpreter_options = {
          Bash_original = {
            use_on_filetypes = { "text" },
          },
        },
      })
      vim.api.nvim_set_keymap("v", "<leader>r", "<Plug>SnipRun", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>SnipRun", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>rr", "<Plug>SnipRunOperator", { silent = true })
    end,
  },
}
