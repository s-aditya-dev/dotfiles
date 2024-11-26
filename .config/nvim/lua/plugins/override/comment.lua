local M = {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  lazy = false, -- Disable lazy loading
  config = function(_, opts)
    local comment = require("Comment")
    local ts_addon = require("ts_context_commentstring.integrations.comment_nvim")
    opts.pre_hook = ts_addon.create_pre_hook()
    comment.setup(opts)
  end,
}

return M
