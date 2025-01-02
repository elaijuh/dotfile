-- https://github.com/ibhagwan/fzf-lua/blob/main/README.md#default-options
return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      local actions = require("fzf-lua.actions")
      require("fzf-lua").setup({
        -- fzf_colors = true,
        fzf_colors = {
          ["fg"] = { "fg", "Normal" },
          ["bg"] = { "bg", "Normal" },
          ["hl"] = { "fg", "Comment" },
          ["fg+"] = { "fg", "Normal" },
          ["bg+"] = { "bg", "CursorLine" },
          ["hl+"] = { "fg", "Statement" },
          ["info"] = { "fg", "PreProc" },
          ["prompt"] = { "fg", "Conditional" },
          ["pointer"] = { "fg", "Exception" },
          ["marker"] = { "fg", "Keyword" },
          ["spinner"] = { "fg", "Label" },
          ["header"] = { "fg", "Comment" },
          ["gutter"] = "-1",
        },
        winopts = {
          border = "single",
          fullscreen = false, -- F2 to toggle
          preview = {
            wrap = "wrap",
            hidden = "nohidden",
            title = false,
            horizontal = "right:60%",
            vertical = "up:70%",
            layout = "flex",
          },
        },
        fzf_opts = {
          ["--border"] = "none",
          ["--layout"] = "default",
        },
        previewers = {
          builtin = {
            scrollbar = false,
          },
        },
        grep = {
          winopts = {
            preview = {
              hidden = "hidden",
              layout = "vertical",
            },
          },
          actions = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-g"] = actions.grep_lgrep,
          },
        },
        buffers = {
          git_icons = false,
          actions = {
            ["ctrl-w"] = actions.buf_del,
            ["ctrl-q"] = actions.file_sel_to_qf,
          },
        },
        files = {
          fd_opts = [[--color never --type f --hidden --follow --strip-cwd-prefix]],
          git_icons = false,
          actions = {
            ["default"] = actions.file_edit,
            ["ctrl-q"] = actions.file_sel_to_qf,
          },
        },
        quickfix = {
          git_icons = false,
          actions = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-q"] = actions.file_sel_to_qf,
          },
        },
        lsp = {
          async_or_timeout = false,
          severity = "Warning",
          -- icons = {
          --   ["Error"] = { icon = vim.g.diagnostic_icons.Error, color = "red" },
          --   ["Warning"] = { icon = vim.g.diagnostic_icons.Warning, color = "yellow" },
          --   ["Information"] = { icon = vim.g.diagnostic_icons.Information, color = "blue" },
          --   ["Hint"] = { icon = vim.g.diagnostic_icons.Hint, color = "blue" },
          -- },
          actions = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-q"] = actions.file_sel_to_qf,
          },
        },
      })
      vim.api.nvim_set_keymap(
        "n",
        "<C-p>",
        [[<CMD>lua require('fzf-lua').files()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<C-m>",
        [[<CMD>lua require('fzf-lua').buffers()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<C-g>",
        [[<CMD>lua require('fzf-lua').live_grep()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fs",
        [[<CMD>lua require('fzf-lua').live_grep_resume()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<C-/>",
        [[<CMD>lua require('fzf-lua').lgrep_curbuf()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fp",
        [[<CMD>lua require('fzf-lua').files_resume()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ff",
        [[<CMD>lua require('fzf-lua').git_status()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fw",
        [[<CMD>lua require('fzf-lua').grep_cWORD()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fg",
        [[<CMD>lua require('fzf-lua').git_files()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fm",
        [[<CMD>lua require('fzf-lua').marks()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fy",
        [[<CMD>lua require('fzf-lua').registers()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fh",
        [[<CMD>lua require('fzf-lua').help_tags()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fq",
        [[<CMD>lua require('fzf-lua').quickfix()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fa",
        [[<CMD>lua require('fzf-lua').lsp_code_actions()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "gr",
        [[<CMD>lua require('fzf-lua').lsp_references()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "gd",
        [[<CMD>lua require('fzf-lua').lsp_definitions()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fb",
        [[<CMD>lua require('fzf-lua').lsp_document_diagnostics()<CR>]],
        { silent = true, noremap = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fn",
        [[<CMD>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>]],
        { silent = true, noremap = true }
      )
    end,
  },
}
