---@type NvPluginSpec
local M = {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  -- dependencies = { "folke/twilight.nvim" },
  cmd = "ZenMode",
  config = function()
    local zen_mode = require("zen-mode")
    local gitsigns = require("gitsigns")
    local incline = require("incline")

    zen_mode.setup({
      window = {
        options = {
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
        },
      },
      plugins = {
        twilight = { enable = false },
      },
      -- Other ZenMode configurations if needed
      on_open = function()
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        gitsigns.toggle_signs(false)
        incline.enable()
      end,
      on_close = function()
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        gitsigns.toggle_signs(true)
        incline.disable()
      end,
    })
  end,
}

return M
