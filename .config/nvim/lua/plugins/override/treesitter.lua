local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local opts = {
      ensure_installed = {
        "bash",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "html",
        "javascript",
        "json",
        "typescript",
        "tsx",
        "css",
        "python",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
}
return M
