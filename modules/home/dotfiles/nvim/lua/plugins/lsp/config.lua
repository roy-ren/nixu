return {
  {
    "b0o/SchemaStore.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      "saghen/blink.cmp",
    },
    opts = function()
      local lsp_configs = {}
      local option_path = vim.fn.stdpath "config" .. "/lua/options/lsp"

      for _, file in ipairs(vim.fn.readdir(option_path)) do
        if file:match "%.lua$" and file ~= "nvlsp.lua" then -- 排除工具文件
          local server_name = file:gsub("%.lua$", "")
          lsp_configs[server_name] = require("options.lsp." .. server_name)
        end
      end

      return {
        servers = lsp_configs,
      }
    end,

    config = function(_, opts)
      local lspconfig = require "lspconfig"
      local nvlsp = require "options.lsp.nvlsp"
      nvlsp.defaults()

      local conf = {
        on_init = nvlsp.on_init,
        on_attach = nvlsp.on_attach,
        -- capabilities = nvlsp.capabilities,
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        capabilities = require("blink.cmp").get_lsp_capabilities(nvlsp.capabilities),
      }

      for server_name, config in pairs(opts.servers) do
        lspconfig[server_name].setup(vim.tbl_deep_extend("force", conf, config))
      end
    end,
  },
}
