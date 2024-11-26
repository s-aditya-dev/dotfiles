---@type NvPluginSpec
local M = {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  dependencies = { "folke/twilight.nvim" },
  cmd = "ZenMode",
}

return M
