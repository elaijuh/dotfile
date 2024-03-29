local cmp = require("cmp")
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    expand = function(args) vim.fn['vsnip#anonymous'](args.body) end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
	  ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
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
  sources = cmp.config.sources {
    { name = 'vsnip'},
    { name = 'buffer', options = { get_bufnrs = vim.api.nvim_list_bufs } },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
})

-- Use buffer source for '/', '?'.
cmp.setup.cmdline({'/', '?'}, {
  -- completion = { autocomplete = false },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
  -- { name = 'buffer' }
    { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  -- completion = { autocomplete = false },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

