return {
  "keaising/im-select.nvim",
  config = function()
    local uname = vim.loop.os_uname().sysname

    local config = {
      set_default_events = {
        "VimEnter",
        "FocusGained",
        "InsertLeave",
        "CmdlineLeave",
      },
      set_previous_events = { "InsertEnter" },
      keep_quiet_on_no_binary = true,
      async_switch_im = true,
    }

    if uname == "Darwin" then
      -- macOS
      config.default_command = "macism"
      config.default_im_select = "com.apple.keylayout.ABC"
    elseif uname == "Linux" then
      -- Linux（假设使用 fcitx5）
      config.default_command = "fcitx5-remote"
      config.default_im_select = "1" -- 你可以改为自己 fcitx5 英文输入法的编号
    end

    require("im_select").setup(config)
  end,
}
