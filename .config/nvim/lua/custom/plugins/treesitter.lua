local M = {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    local opts = require "plugins.configs.treesitter"
    opts.ensure_installed = {
      "lua",
      "html",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "python",
      "java",
    }

    return opts
  end,
}

return M
