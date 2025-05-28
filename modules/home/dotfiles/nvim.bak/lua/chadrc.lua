---@diagnostic disable: inject-field
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@diagnostic disable-next-line: undefined-doc-name
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "vscode_dark",

  transparency = true,
  hl_override = {
    -- Comment = { italic = true },
    -- ["@comment"] = { italic = true },
    -- ["LineNr"] = { fg = "#e2c3db", bg = "#002240" },
  },
}

return M
