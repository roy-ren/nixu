return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    lsp = {
      on_attach = require("options.lsp.nvlsp").on_attach,
      on_init = require("options.lsp.nvlsp").on_init,
      capabilities = require("options.lsp.nvlsp").capabilities,
    },
    fvm = ".fvm/flutter_sdk",
  },
  config = function(_, opts)
    require("flutter-tools").setup(opts)
  end,
}
