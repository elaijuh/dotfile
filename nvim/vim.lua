require("gitsigns").setup()


-- nvim-treesitter
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

-- nvim-lspconfig config
local on_attach = function(client, bufnr)
   -- 为方便使用，定义了两个工具函数
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   -- 配置标准补全快捷键
   -- 在插入模式可以按 <c-x><c-o> 触发补全
   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

   local opts = { noremap=true, silent=true }

   -- 设置 normal 模式下的快捷键
   -- 第一个参数 n 表示 normal 模式
   -- 第二个参数表示按键
   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
   -- 跳转到定义或者声明的地方
   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
   -- 查看接口的所有实现
   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
   -- 查看所有引用当前对象的地方
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
   -- 跳转到下一个/上一个语法错误
   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
   buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
   -- 手工触发格式化
   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
   -- 列出所有语法错误列表
   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
   -- 修改当前符号的名字
   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").gopls.setup({
   cmd = {"gopls", "serve"}, 
   filetype = {"go", "gomod"},
   on_attach = on_attach,
   flags = {
     debounce_text_changes = 150,
   },
   settings = {
     gopls = {
    analyses = {
   unusedparams = true,
    },
    staticcheck = true,
     },
   },
   capabilities = capabilities,
})

local cmp = require("cmp")

local has_words_before = function()
   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    -- 必须指定 snippet 组件
    snippet = {
        expand = function(args) vim.fn['vsnip#anonymous'](args.body) end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
              cmp.select_next_item()
	    elseif vim.fn["vsnip#available"](1) == 1 then
	      feedkey("<Plug>(vsnip-expand-or-jump)", "")
	    elseif has_words_before() then
	      cmp.complete()
	    else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	    end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function()
	      if cmp.visible() then
		cmp.select_prev_item()
	      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	      end
	end, { "i", "s" }),
    },
    -- 配置补全内容来源
    sources = cmp.config.sources {
        -- 支持从打开的文件中补全内容
        { name = 'buffer', options = { get_bufnrs = vim.api.nvim_list_bufs } },
	-- 支持从 lsp 服务补全
        { name = 'nvim_lsp' },
	-- 支持补全文件路径，可以输入 / 或者 ~ 体验
        { name = 'path' },
    },
})


-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
   sort_by = "case_sensitive",
   view = {
      adaptive_size = true,
      mappings = {
         list = {
          { key = "u", action = "dir_up" },
         },
      },
   },
   renderer = {
      group_empty = true,
      icons = {
         show = {
            folder = true,
            folder_arrow = true,
            file = false,
            git = true,
         },
      },
   },
   filters = {
      dotfiles = true,
   },
})

-- gitsigns
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
