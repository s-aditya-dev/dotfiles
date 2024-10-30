local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        --python
        "pyright",
        "mypy",
        "black",
        --java
        "jdtls",
        --web dev
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd",
      },
      automatic_installation = true,
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true,    -- Auto close tags
          enable_rename = true,   -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "plugins.configs.treesitter"
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
    end
  },
}

return plugins
