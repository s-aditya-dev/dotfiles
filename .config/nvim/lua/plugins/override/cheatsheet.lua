local customPalette = require("ui.palette")

local M = { "s-aditya-dev/nvcheatsheet.nvim" }

M.opts = {
  -- Default header
  header = {
    "                                      ",
    "                                      ",
    "                                      ",
    "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
    "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
    "                                      ",
    "                                      ",
    "                                      ",
  },
  -- Example keymaps
  keymaps = {},
}

function M.highlight(palette)
  return {
    NvChAsciiHeader = { bg = "NONE", fg = palette.fg }, -- Title
    NvChSection = { bg = palette.alt_bg }, -- Each card
    -- Colors for the headers
    NvCheatsheetWhite = { bg = palette.white, fg = palette.bg },
    NvCheatsheetGray = { bg = palette.gray, fg = palette.fg },
    NvCheatsheetBlue = { bg = palette.blue, fg = palette.bg },
    NvCheatsheetCyan = { bg = palette.cyan, fg = palette.bg },
    NvCheatsheetRed = { bg = palette.red, fg = palette.fg },
    NvCheatsheetGreen = { bg = palette.green, fg = palette.bg },
    NvCheatsheetYellow = { bg = palette.yellow, fg = palette.bg },
    NvCheatsheetOrange = { bg = palette.orange, fg = palette.bg },
    NvCheatsheetPurple = { bg = palette.purple, fg = palette.fg },
    NvCheatsheetMagenta = { bg = palette.magenta, fg = palette.bg },
  }
end

function M.config(_, opts)
  -- Load mappings from mappings.lua
  local mappings = require("mappings")

  opts.keymaps = opts.keymaps or {}

  -- Convert mappings to cheatsheet format
  for category, modes in pairs(mappings) do
    local category_keymaps = {}
    for _, mapping_table in pairs(modes) do
      for key, map in pairs(mapping_table) do
        table.insert(category_keymaps, { map[2], key })
      end
    end
    opts.keymaps[category] = category_keymaps
  end

  local nvcheatsheet = require("nvcheatsheet")
  nvcheatsheet.setup(opts)

  -- Apply the highlights
  local highlights = M.highlight(customPalette)
  for group, color in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, color)
  end
end

return M
