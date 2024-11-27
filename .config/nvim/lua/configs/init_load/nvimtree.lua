local nvimtree = require("nvim-tree")
local function pad_icon(icon)
  return icon .. " "
end

nvimtree.setup({
  filters = {
    custom = {}, -- Ensure no custom patterns are set to hide files
    exclude = { ".env" }, -- Optionally, explicitly include `.env`
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {

    root_folder_label = function(path)
      local home = vim.fn.expand("~")
      local relative_path = path:gsub("^" .. home, "~")
      local parts = vim.split(relative_path, "/")
      if #parts > 3 then
        relative_path = parts[1] .. "/" .. parts[2] .. "/.../" .. parts[#parts]
      end

      return "  " .. relative_path
    end,

    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      git_placement = "after",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "󱉆",
        },

        git = {
          unstaged = pad_icon("󰅗"),
          staged = pad_icon(""),
          unmerged = pad_icon(""),
          renamed = pad_icon("󰞋"),
          untracked = pad_icon(""),
          deleted = pad_icon("󰍵"),
          ignored = pad_icon("󰀧"),
        },
      },
    },
  },
})
