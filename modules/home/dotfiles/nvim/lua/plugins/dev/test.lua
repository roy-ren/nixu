---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sidlatau/neotest-dart",
  },
  keys = {
    {
      "<leader>jk",
      function()
        require("neotest").run.run()
      end,
      desc = "跑单测",
    },
    {
      "<leader>jj",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      desc = "跑当前文件的单测",
    },
    {
      "<leader>jd",
      function()
        require("neotest").run.run { strategy = "dap" }
      end,
      desc = "跑单测（DAP）",
    },
    {
      "<leader>js",
      function()
        require("neotest").run.stop()
      end,
      desc = "停止单测",
    },
    {
      "<leader>ja",
      function()
        require("neotest").run.attach()
      end,
      desc = "单测附加",
    },
    {
      "<leader>jt",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "打开/关闭单测输出",
    },
    {
      "<leader>jc",
      function()
        require("neotest").output_panel.clear()
      end,
      desc = "清空单测输出",
    },
    {
      "<leader>jw",
      function()
        require("neotest").watch.toggle(vim.fn.expand "%")
      end,
      desc = "单测 watch",
    },
    {
      "<leader>jsc",
      function()
        require("neotest").summary.close()
      end,
      desc = "关闭单测列表",
    },
    {
      "<leader>jso",
      function()
        require("neotest").summary.open()
      end,
      desc = "打开单测列表",
    },
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-dart" {
          command = "fvm flutter", -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {
            "blocTest",
          },
        },
      },
    }
  end,
}
