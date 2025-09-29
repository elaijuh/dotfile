return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      format = {
        lsp_fallback = true,
        async = false,
        quiet = false,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        bash = { "shfmt" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        c = { "clangd" },
        cpp = { "clangd" },
        html = { "dprint" },
        css = { "dprint" },
        javascript = { "dprint" },
        typescript = { "dprint" },
        json = { "dprint" },
        yaml = { "dprint" },
        markdown = { "dprint" },
        python = { "black" },
        ["_"] = { "trim_whitespace" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "0", "-ci" },
        },
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") or bufname:match("/slides/") then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      -- format_after_save = function(bufnr)
      --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      --     return
      --   end
      --   -- ...additional logic...
      --   return { lsp_fallback = true }
      -- end,
    })

    local function format()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end

    vim.keymap.set({ "n", "v" }, "<leader>f", format, { desc = "Format buffers or range in visual mode" })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
