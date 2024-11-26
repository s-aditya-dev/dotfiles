local M = {
  "mistricky/codesnap.nvim",
  event = "LspAttach",
  opts = {
    save_path = "~/Pictures/CodeSnap/",
    code_font_family = "JetBrainsMono Nerd Font",
    has_breadcrumbs = true,
    bg_theme = "grape",
    -- bg_x_padding = 82,
    -- bg_y_padding = 82,
    -- title = "",
    -- watermark = "",
  },
  build = "make",
}

return M
