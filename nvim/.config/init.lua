-- [[ colorscheme ]]
-- vim.g.seoul256_background = 253
-- vim.cmd [[colorscheme seoul256]]
-- vim.opt.background = 'light'
-- vim.cmd [[colorscheme paper]]
-- vim.cmd [[colorscheme gruvbox]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("lazy").setup("plugins")
