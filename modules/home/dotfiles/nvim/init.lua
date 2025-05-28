vim.g.mapleader = " "
-- nvchad UI
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
---@diagnostic disable-next-line: different-requires
require("lazy").setup {
  -- { import = "plugins" },
  require("plugins").specs
}

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

require "options"
require "config"

vim.schedule(function()
  require "keymaps"
end)
