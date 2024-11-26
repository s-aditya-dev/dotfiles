local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    scss = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },

    sh = { "shfmt" },

    -- Conform will run multiple formatters sequentially
    python = { "black" },
  },

  formatters = {
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "80",
      },
    },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },

  format_after_save = {
    lsp_format = "fallback",
  },
}

return options
