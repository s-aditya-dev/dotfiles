local M = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      --python
      "pyright",
      "mypy",
      "ruff",
      "black",
      --web dev
      "typescript-language-server",
      "tailwindcss-language-server",
      "eslint-lsp",
      "prettierd",
      --lua
      "stylua",
      "lua-language-server",
      --shell scripting
      "shfmt",
    },
  },
}

return M
