local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
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
        --shell scripting
        "shfmt",
      },
    },
    {
      "nvimtools/none-ls.nvim",
      event = "VeryLazy",
      opts = function()
        return require "custom.configs.null-ls"
      end,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true,           -- Auto close tags
          enable_rename = true,          -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },
  {
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
  },
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require "oil"
      oil.setup {
        keymaps = {
          ["<Esc>"] = { callback = "actions.close", mode = "n" },
        },
      }
    end,
  },
}

return plugins
