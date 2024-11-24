return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    'nvim-lua/plenary.nvim'
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", function() vim.cmd("enew") end, {}),

      dashboard.button("f", "  Find project", ":lua require'telescope.builtin'.find_files{}<CR>", {}),

      dashboard.button("r", "  Recent files", ":lua require'telescope.builtin'.oldfiles{}<CR>", {}),

      dashboard.button("q", "󰈆  Quit", ":qa<CR>", {}),
    }

    alpha.setup(dashboard.opts)
  end,
}
