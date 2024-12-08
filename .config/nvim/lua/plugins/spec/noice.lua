return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {}, -- global options for the cmdline. See section on views
      ---@diagnostic disable-next-line: undefined-doc-name
      ---@type table<string, CmdlineFormat>
      format = {
        cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
        search_down = {
          kind = "search",
          pattern = "^/",
          icon = "  ",
          lang = "regex",
        },
        search_up = {
          kind = "search",
          pattern = "^%?",
          icon = "  ",
          lang = "regex",
        },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = {
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = " ",
          lang = "lua",
        },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
        input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
      },
    },
    messages = {
      enabled = false,
    },
    popupmenu = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      progress = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
  },
}
