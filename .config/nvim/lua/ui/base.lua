local highlights = require("ui.highlights")

local M = {
  theme = "catppuccin",
  transparency = true,
  theme_toggle = { -- Toggle themes
    "tokyodark",
    "catppuccin",
  },
  hl_add = highlights.add,
  hl_override = highlights.override,
}

return M
