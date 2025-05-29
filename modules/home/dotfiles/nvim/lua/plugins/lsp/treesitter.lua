return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
  },
  build = ":TSUpdate",
  config = function()
    pcall(function()
      -- dofile(vim.g.base46_cache .. "syntax")
      -- dofile(vim.g.base46_cache .. "treesitter")
    end)

    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup {
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = { "javascript" },

      ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "dart",
        "nix",
        "json",
        "javascript",
        "markdown",
        "markdown_inline",
        "latex",
        "html",
        "markdown",
        "css",
        -- "norg",
        "scss",
        "svelte",
        "tsx",
        "typst",
        "vue",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    }
  end,
}
