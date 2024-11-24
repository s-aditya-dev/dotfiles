local M = {
  -- Add LuaSnip if it's not already included
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").setup {}
    end,
  },
}

return M
