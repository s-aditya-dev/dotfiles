local M = {}
local highlights = require "custom.highlights"
local asciiArt = require "custom.ascii-art"

M = {
  hl_override = highlights.override,
  hl_add = highlights.add,
  theme = "catppuccin", -- Default theme
  theme_toggle = {      -- Toggle themes
    "tokyodark",
    "catppuccin",
  },
  transparency = true,
  telescope = {
    style = "bordered",
  },
  statusline = {
    overriden_modules = function(modules)
      table.remove(modules, 7)
    end,
    theme = "minimal",
    -- separator_style = "round",
  },
  nvdash = {
    load_on_startup = true,
    header = asciiArt.hydra,
    buttons = {
      { "  New File", "Spc b", "<cmd> enew <CR>" },
      { "󰱼  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

return M
