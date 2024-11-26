return {
  -- override plugins
  require("plugins.override.lsp"),
  require("plugins.override.lint"),
  require("plugins.override.treesitter"),
  require("plugins.override.conform"),
  require("plugins.override.cheatsheet"),
  require("plugins.override.comment"),
  require("plugins.override.luasnip"),

  -- new plugins
  require("plugins.spec.oil"),
  require("plugins.spec.auto-tag"),
  require("plugins.spec.codesnap"),
  require("plugins.spec.ts-context-commentString"),
  require("plugins.spec.dap"),
  require("plugins.spec.mason"),
  require("plugins.spec.zen-mode"),
  require("plugins.spec.regex-explainer"),
}
