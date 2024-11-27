local asciiArt = require("ui.ascii-art")

local M = {
  load_on_startup = true,
  header = asciiArt.hydra,
  buttons = {
    { txt = "  New File", keys = "Spc b", cmd = ":enew" },
    {
      txt = "󰱼  Find File",
      keys = "Spc f f",
      cmd = ":Telescope find_files",
    },
    {
      txt = "󰈚  Recent Files",
      keys = "Spc f o",
      cmd = ":Telescope oldfiles",
    },
    { txt = "  Find Word", keys = "Spc f w", cmd = ":Telescope live_grep" },
    { txt = "  Bookmarks", keys = "Spc m a", cmd = ":Telescope marks" },
    { txt = "  Themes", keys = "Spc t h", cmd = ":Telescope themes" },
    {
      txt = "  Mappings",
      keys = "Spc c h",
      cmd = ":lua require('nvcheatsheet').toggle()",
    },
  },
}

return M
