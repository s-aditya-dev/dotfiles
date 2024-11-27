-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local base = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")

-- setup server function
local function setup_server(server_name, filetypes, config)
  lspconfig[server_name].setup(vim.tbl_extend("force", {
    on_attach = base.on_attach,
    on_init = base.on_init,
    capabilities = base.capabilities,
    filetypes = filetypes,
  }, config or {}))
end

lspconfig.servers = {
  -- "eslint",
  "tailwindcss",
  "html",
  "cssls",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "pyright",
}

-- Default Servers
local default_servers = {
  -- {
  --   name = "eslint",
  --   filetypes = {
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact",
  --   },
  -- },
  {
    name = "tailwindcss",
    filetypes = {
      "html",
      "css",
      "javascript",
      "javascriptreact",
      "typescriptreact",
    },
  },
  {
    name = "html",
    filetypes = { "html" },
  },
  {
    name = "cssls",
    filetypes = { "css", "scss" },
  },
  {
    name = "jsonls",
    filetypes = { "json" },
  },
}

-- Setup default servers
for _, server in ipairs(default_servers) do
  setup_server(server.name, server.filetypes)
end

-- TypeScript-specific config
local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

setup_server("ts_ls", { "typescript", "typescriptreact" }, {
  init_options = {
    preferences = {
      disableSuggestions = true, --this disables the suggestions for ts
    },
  },
  commands = {
    OrganizeImports = {
      ts_organize_imports,
      description = "Organize Imports",
    },
  },
})

-- Pyright with specific configuration
setup_server("pyright", { "python" }, {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Disable type checking diagnostics
      },
    },
  },
})
