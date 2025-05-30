return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- 永远不要将此值设置为 "*"！永远不要！
  opts = {
    -- 在此处添加任何选项
    -- 例如
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o", -- 您想要的模型（或使用 gpt-4o 等）
      timeout = 30000, -- 超时时间（毫秒），增加此值以适应推理模型
      temperature = 0,
      max_tokens = 8192, -- 增加此值以包括推理模型的推理令牌
      --reasoning_effort = "medium", -- low|medium|high，仅用于推理模型
    },
  },
  -- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- 对于 Windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- 以下依赖项是可选的，
    "echasnovski/mini.pick", -- 用于文件选择器提供者 mini.pick
    "nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
    "hrsh7th/nvim-cmp", -- avante 命令和提及的自动完成
    "ibhagwan/fzf-lua", -- 用于文件选择器提供者 fzf
    "nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- 用于 providers='copilot'
    {
      -- 支持图像粘贴
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- 推荐设置
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- Windows 用户必需
          use_absolute_path = true,
        },
      },
    },
    {
      -- 如果您有 lazy=true，请确保正确设置
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
