return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.formatters.shfmt = {
      prepend_args = { "-i", "2" },
    }
    conform.setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        ["_"] = { "trim_whitespace" },
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
        if bufname:match("/node_modules/") then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- ...additional logic...
        return { lsp_fallback = true }
      end,
    })

    local function format()
      conform.format({
        lsp_fallback = true,
      })
    end

    vim.keymap.set("n", "<leader>f", format, { desc = "Format buffers" })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
