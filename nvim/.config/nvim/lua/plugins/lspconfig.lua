return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>gd", vim.lsp.buf.definition, desc = "Go definition" },
      { "<leader>gD", vim.lsp.buf.declaration, desc = "Go declaration" },
      { "[d", vim.diagnostic.goto_prev, desc = "Go to previous [D]iagnostic message" },
      { "]d", vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },
      { "<leader>e", vim.diagnostic.open_float, desc = "Show diagnostic [E]rror messages" },
      { "<leader>q", vim.diagnostic.setloclist, desc = "Open diagnostic [Q]uickfix list" },
      { "<leader>gi", vim.lsp.buf.implementation },
      { "<C-s>", vim.lsp.buf.signature_help },
      { "<leader>gr", vim.lsp.buf.references },
      { "<leader>ca", vim.lsp.buf.code_action },
      { "<leader>D", vim.lsp.buf.type_definition },
      { "<leader>rn", vim.lsp.buf.rename },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
        init_options = {
          usePlaceholders = true,
        },
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
    end,
  },
}
