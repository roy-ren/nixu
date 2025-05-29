return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {

    {
      "<C-n>",
      function()
        vim.cmd "Neotree left toggle reveal"
        -- vim.cmd "Neotree float toggle reveal_force_cwd"
      end,
      mode = "n",
      desc = "Toggle NeoTree in current directory",
    },

    -- Reveal current file in NeoTree
    {
      "<leader>e",
      function()
        vim.cmd "Neotree left reveal"
        -- vim.cmd "Neotree float toggle reveal_force_cwd"
      end,
      mode = "n",
      desc = "Reveal file in NeoTree",
    },

    -- Toggle NeoTree in the current directory
    {
      "<leader>E",
      function()
        vim.cmd "Neotree float toggle reveal_force_cwd"
      end,
      mode = "n",
      desc = "Toggle NeoTree in current directory",
    },

    -- Toggle NeoTree buffers on the right side
    {
      "<leader>b",
      function()
        vim.cmd "Neotree toggle show buffers right"
      end,
      mode = "n",
      desc = "Toggle NeoTree buffers",
    },

    -- Show Git status in a floating NeoTree window
    {
      "<leader>gs",
      function()
        vim.cmd "Neotree float git_status"
      end,
      mode = "n",
      desc = "Show Git status in NeoTree",
    },
  },
  cmd = "NeoTree",
}
