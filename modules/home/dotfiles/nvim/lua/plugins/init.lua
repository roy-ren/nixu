-- plugins/init.lua
local M = {}

-- M.specs = {
--   require "plugins.code.cmp",
--   require "plugins.code.format",
--   require "plugins.code.leap",
--   require "plugins.code.replace",
--   require "plugins.code.ufo",
--
--   require "plugins.dev.test",
--   require "plugins.dev.todo",
--   require "plugins.dev.trouble",
--
--   require "plugins.lsp.config",
--   require "plugins.lsp.treesitter",
--
--   require "plugins.nav-utils.bqf",
--   require "plugins.nav-utils.harpoon",
--   require "plugins.nav-utils.snacks",
--   require "plugins.nav-utils.telescope",
--   require "plugins.nav-utils.which-key",
--
--   require "plugins.ui.mini",
--   require "plugins.ui.neotree",
--   require "plugins.ui.nvchad",
-- }

-- 日志工具（兼容 Neovim API）
local log = function(level, msg)
  local levels = { "DEBUG", "INFO", "WARN", "ERROR" }
  vim.schedule(function()
    vim.api.nvim_echo({ { string.format("[Lazy] %s: %s", levels[level], msg) } }, true, {})
  end)
end

-- 递归查找所有插件配置
local function find_plugin_specs()
  local specs = {}
  local plugins_root = vim.fn.stdpath "config" .. "/lua/plugins" -- 假设路径为 ~/.config/nvim/lua/plugins

  local cmd = string.format("find '%s' -type f -name '*.lua' -not -name 'init.lua'", plugins_root)

  local handle = io.popen(cmd)
  if not handle then
    log(4, "Failed to scan plugins directory")
    return specs
  end

  -- 处理所有匹配的 Lua 文件
  for file_path in handle:lines() do
    -- 转换路径为 Lua 模块格式（plugins.xxx.yyy）
    local mod_path = file_path:gsub("^" .. plugins_root .. "/", ""):gsub(".lua$", ""):gsub("/", ".")

    -- 生成 Lazy 规范
    table.insert(specs, { import = "plugins." .. mod_path })
    log(2, "Discovered plugin spec: plugins." .. mod_path)
  end

  handle:close()
  return specs
end

-- Lazy 插件规范入口
M.specs = find_plugin_specs()

return M
