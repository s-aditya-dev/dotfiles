local M = {}

-- General keybindings
M.General = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Move to beginning of line" },
    ["<C-e>"] = { "<End>", "Move to end of line" },
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },

    ["<C-a>"] = { "<cmd>normal! ggVG<CR>", "Select all" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "Move line up in insert mode" },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "Move line down in insert mode" },
  },
  n = {
    ["<C-h>"] = { "<C-w>h", "Switch window left" },
    ["<C-l>"] = { "<C-w>l", "Switch window right" },
    ["<C-j>"] = { "<C-w>j", "Switch window down" },
    ["<C-k>"] = { "<C-w>k", "Switch window up" },

    ["<Esc>"] = { "<cmd>noh<CR>", "Clear highlights" },

    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
    ["<C-c>"] = { "<cmd>%y+<CR>", "Copy whole file" },
    ["<C-a>"] = { "<cmd>normal! ggVG<CR>", "Select whole file" },

    [";"] = { ":", "CMD enter command mode" },

    ["<leader>n"] = { "<cmd>set nu!<CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd>set rnu!<CR>", "Toggle relative number" },

    --move line above and below
    ["<A-k>"] = { ":m .-1<CR>==", "Move line up" },
    ["<A-j>"] = { ":m .+2<CR>==", "Move line down" },

    --copy line above and below
    ["<C-S-k>"] = { "yyP", "Copy line above" },
    ["<C-S-j>"] = { "yyp", "Copy line below" },

    --Others
    ["<leader>ch"] = {
      function()
        require("nvcheatsheet").toggle()
      end,
      "Toggle Cheatsheet",
    },
  },

  v = {
    --move line above and below
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move selection up" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move selection down" },
  },
}

-- Comment Keybindings
M.Comment = {
  n = {
    ["<leader>/"] = { "", "Toggle line comment", remap = true },
    ["<C-/>"] = { "", "Toggle block comment" },
  },
}

-- Oil Nvim keybindings
M["Oil Nvim"] = {
  n = {
    ["-"] = { "<cmd>lua require('oil').toggle_float()<CR>", "Toggle Oil floating window" },
  },
}

-- NeoTree keybindings
M.NvimTree = {
  n = {
    ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NeoTree" },
    ["<leader>e"] = { "<cmd>NvimTreeFocus<CR>", "Focus NeoTree" },
  },
}

M.tabufline = {

  n = {
    ["<leader>b"] = { "<cmd>enew<CR>", "New buffer" },

    -- cycle through buffers
    ["<tab>"] = {
      function()
        require("nvchad.tabufline").next()
      end,
      "Goto next buffer",
    },

    ["<S-tab>"] = {
      function()
        require("nvchad.tabufline").prev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      "",
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "",
      "Toggle comment",
    },

    ["<C-/>"] = {
      "",
      "Toggle block comment",
    },
  },
}

M.telescope = {

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<leader>vth"] = {
      function()
        require("nvchad.themes").open()
      end,
      "New Nvchad themes selector",
    },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.lspconfig = {

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" } })
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" } })
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.whichkey = {

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd("WhichKey")
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

M.CodeSnap = {
  x = {
    ["<leader>cc"] = { ":<C-U>CodeSnap<CR>", "CodeSnap copy" },
    ["<leader>cs"] = { ":<C-U>CodeSnapSave<CR>", "CodeSnap copy" },
    ["<leader>chc"] = { ":<C-U>CodeSnapHighlight<CR>", "CodeSnap copy" },
    ["<leader>chs"] = { ":<C-U>CodeSnapSaveHighlight<CR>", "CodeSnap copy" },
  },
}

M.gitsigns = {

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

return M
