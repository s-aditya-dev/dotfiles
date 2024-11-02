local base = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"

local function setup_server(server_name, config)
  lspconfig[server_name].setup(vim.tbl_extend("force", {
    on_attach = base.on_attach,
    capabilities = base.capabilities,
  }, config or {}))
end

-- List of servers with default configuration
local servers = { "tailwindcss", "eslint", "cssls", "jdtls" }
for _, server in ipairs(servers) do
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

-- Auto-organize imports on save for TypeScript files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ts,*.tsx,*js,*jsx",
  callback = function()
    ts_organize_imports()
  end,
})

-- Pyright with specific configuration
setup_server("pyright", { filetype = { "python" } })
