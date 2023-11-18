vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local function nvimtree_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer=bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))
  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
end

require("nvim-tree").setup({
  on_attach = nvimtree_on_attach,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 60,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    group_empty = false,
    icons = {
      show = {
        folder = false,
        folder_arrow = true,
        file = false,
        git = true,
        modified = true
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

