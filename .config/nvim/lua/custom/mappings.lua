local M = {}

M.general = {
  n = {
    ["<C-a>"] = { "<cmd>normal! ggVG<CR>", "Select all" },

    --move line above and below
    ["<A-k>"] = { ":m .-2<CR>==", "Move line up" },
    ["<A-j>"] = { ":m .+1<CR>==", "Move line down" },

    --copy line above and below
    ["<C-S-k>"] = { "yyP", "Copy line above" },
    ["<C-S-j>"] = { "yyp", "Copy line below" },
  },

  i = {
    ["<C-a>"] = { "<cmd>normal! ggVG<CR>", "Select all" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "Move line up in insert mode" },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "Move line down in insert mode" },
  },

  v = {
    --move line above and below
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move selection up" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move selection down" },

    --copy line above and below
    --[[ ["<C-S-k>"] = { ":<C-u>y'<C-u>:'<,'>put '>+1<CR>gv", "Copy selection above" },
    ["<C-S-j>"] = { ":<C-u>y'<C-u>:'<,'>put '>+1<CR>gv", "Copy selection below" }, ]]
  },
}

M["oil nvim"] = {
  n = {
    ["-"] = { "<cmd>lua require('oil').toggle_float()<CR>", "Toggle Oil floating window" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes

  v = {
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
