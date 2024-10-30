local base = require("plugins.configs.lspconfig")
local lspconfig = require("lspconfig")

local function setup_server(server_name, config)
  lspconfig[server_name].setup(vim.tbl_extend("force", {
    on_attach = base.on_attach,
    capabilities = base.capabilities,
  }, config or {}))
end

-- List of servers with default configuration
local servers = { "ts_ls", "tailwindcss", "eslint", "cssls", "jdtls" }
for _, server in ipairs(servers) do
  setup_server(server)
end

-- Pyright with specific configuration
setup_server("pyright", { filetype = { "python" } })
