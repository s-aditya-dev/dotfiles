local M = {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 2 },
      },
      render = function(props)
        local filename =
          vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color =
          require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        return {
          ft_icon and {
            " ",
            ft_icon,
            " ",
            guibg = "#f38ba8",
            guifg = "#1e1d2d",
          },
          " ",
          filename,
          modified and { " *", guifg = "#888888", gui = "bold" } or "",
          " ",
          guibg = "#2d2c3c",
          guifg = "#f38ba8",
        }
      end,
    })
  end,
  -- Optional: Lazy load Incline
  event = "BufReadPre",
}

return M
