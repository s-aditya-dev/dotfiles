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

        ["<leader>n"] = { "<cmd>set nu!<CR>", "Toggle line number" },
        ["<leader>rn"] = { "<cmd>set rnu!<CR>", "Toggle relative number" },

        --Others
        ["<leader>ch"] = { function() require("nvcheatsheet").toggle() end, "Toggle Cheatsheet" },
        ["<leader>wk"] = { "<cmd>WhichKey<CR>", "whichkey all keymaps" },
    },
}

-- Oil Nvim keybindings
M["Oil Nvim"] = {
    n = {
        ["-"] = { "<cmd>lua require('oil').toggle_float()<CR>", "Toggle Oil floating window" },
    },
}

-- NeoTree keybindings
M.NeoTree = {
    n = {
        ["<C-n>"] = { "<cmd>Neotree toggle<CR>", "Toggle NeoTree" },
        ["<leader>e"] = { "<cmd>Neotree focus<CR>", "Focus NeoTree" },
        ["<A-n>"] = { "<cmd>Neotree buffers toggle float<CR>", "Reveal Buffers in NeoTree" },
    },
}

-- Terminal keybindings
M.Terminal = {
    t = {
        --escape terminal
        ["<C-x>"] = { "<cmd><C-\\><C-N><CR>", "Terminal escape terminal mode" },
    },
    n = {
        --toggle terminal
        ["<A-i>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating terminal" },
        ["<A-h>"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal terminal" },
        ["<A-v>"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical terminal" },

        --new terminal
        ["<leader>h"] = { function() require("nvterm.terminal").new "horizontal" end, "Spawn horizontal terminal" },
        ["<leader>v"] = { function() require("nvterm.terminal").new "vertical" end, "Spawn vertical terminal" },
    },
}

return M
