---@type NvPluginSpec
return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("nvchad.configs.luasnip")

    local ls = require("luasnip")

    ls.filetype_extend("javascriptreact", { "html" })
    ls.filetype_extend("typescriptreact", { "html" })

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets/vscode" },
    })
  end,
}
