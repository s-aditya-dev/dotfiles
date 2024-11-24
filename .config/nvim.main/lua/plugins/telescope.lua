return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-f>", builtin.find_files, {desc = "find files"})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "fuzy find file"})
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc = "find old files"})

      require("telescope").load_extension("ui-select")
    end,
  },
}
