return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    -- opts = {
    --   ensure_installed = {
    --     "clangd",
    --     "clang-format",
    --   },
    -- },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      mason.setup({
        -- ui = {
        --   icons = {
        --     package_installed = "✓",
        --     package_pending = "➜",
        --     package_uninstalled = "✗",
        --   },
        -- },
      })
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
        },
      })
    end,
  },
}
