local M = {
  "d-vegapunk/live-server.nvim",
  event = "VeryLazy",
  build = "npm install -g live-server",
  config = function()
    require("live-server").setup({
      liveserver_args = {
        "--port=3621",
        "--no-css-inject",
      },
      integration = {
        lualine = {
          supported_filetypes = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
          },
          icons = {
            disconnected = "󰄙",
            connected = "󰄙",
          },
          colors = {
            disconnected = "#559dd7", --blue
            connected = "#00c234", --green
          },
        },
      },
    })
  end,
}
return M
