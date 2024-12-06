local M = {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    winopts = {
      focusable = false,
      relative = "editor",
      style = "minimal",
      -- border = "rounded",
      height = 1,
      row = 1,
      col = 0,
    },
    timeout = 1,
    maxkeys = 5,
    show_count = false,
    excluded_modes = {}, -- example: {"i"}

    -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
    position = "top-right",
  },
}

return M
