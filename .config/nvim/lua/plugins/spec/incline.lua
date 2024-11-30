local wrap_status = function(label, icon, primary_color, secondary_color, style)
  local result = {}
  local separators = {
    default = { left = "", right = "█" },
    round = { left = "", right = "" },
    block = { left = "█", right = "█" },
    arrow = { left = "", right = "" },
  }

  -- Fetch the separator based on the style
  local separator = separators[style]

  if separator then
    table.insert(result, {
      separator.left,
      guibg = "NONE",
      guifg = primary_color,
    })
  end

  -- Add the main content
  table.insert(result, {
    icon,
    " ",
    guibg = primary_color,
    guifg = secondary_color,
  })
  table.insert(result, {
    " ",
    label,
    guibg = secondary_color,
    guifg = primary_color,
  })

  if separator then
    table.insert(result, {
      separator.right,
      guibg = "NONE",
      guifg = secondary_color,
    })
  end

  return result
end

local getStyle = function()
  local stl_theme = require("ui.ui").statusline.theme
  local stl_sep = require("ui.ui").statusline.separator_style
  local style = "block"

  if stl_theme == "default" then
    style = stl_sep
  end

  if stl_theme == "minimal" then
    if stl_sep and stl_sep == "round" then
      style = "round"
    else
      style = "block"
    end
  end

  return style
end

local M = {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = function()
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 1, vertical = 2 },
      },
      render = function()
        local primary_color = "#cba6f7"
        local secondary_color = "#2d2c3c"
        local label = "ZenMode"
        local icon = ""
        local style = getStyle()

        return wrap_status(label, icon, primary_color, secondary_color, style)
      end,
    })
  end,
}

return M
