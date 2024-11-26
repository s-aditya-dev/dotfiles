-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local base = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")

-- setup server function
local function setup_server(server_name, config)
  lspconfig[server_name].setup(vim.tbl_extend("force", {
    on_attach = base.on_attach,
    on_init = base.on_init,
    capabilities = base.capabilities,
  }, config or {}))
end

lspconfig.servers = { "eslint", "tailwindcss", "html", "cssls", "jsonls", "lua_ls", "ts_ls", "pyright" }

-- Default Servers
local default_servers = { "eslint", "tailwindcss" }

-- lsps with default config
for _, server in ipairs(default_servers) do
  setup_server(server)
end

-- TypeScript-specific config
local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

setup_server("ts_ls", {
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ts,*.tsx,*js,*jsx",
  callback = function()
    ts_organize_imports()
  end,
})

setup_server("cssls", { filetype = { "css", "scss" } })
setup_server("html", { filetype = { "html" } })
setup_server("jsonls", { filetype = { "json" } })
-- Pyright with specific configuration
setup_server("pyright", {
  filetype = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- Disable type checking diagnostics
      },
    },
  },
})
