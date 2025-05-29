return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
    "nvim-tree/nvim-web-devicons",
    "saghen/blink.cmp",
  }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  keys = {
    {
      "<C-p>",
      "<cmd>MarkdownPreviewToggle<CR>",
      mode = "n",
      desc = "[p]review markdown",
    },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup {
      completions = { blink = { enabled = true } },
    }
  end,
}
