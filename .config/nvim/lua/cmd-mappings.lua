local map = vim.keymap.set

-- Dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("n", "<C-/>", "gbc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gb", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new({ pos = "sp" })
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })
