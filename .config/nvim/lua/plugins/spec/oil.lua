local M = {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      keymaps = {
        ["<Esc>"] = { callback = "actions.close", mode = "n" },
      },
    })
  end,
}

return M
