local M = {
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    separator_style = "round", -- default/round/block/arrow
    --this styles only work on default and round and block works on minimal
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "lsp",
      "cursor",
      "cwd",
    },
  },
  telescope = { style = "bordered" }, -- borderless / bordered
}

return M
