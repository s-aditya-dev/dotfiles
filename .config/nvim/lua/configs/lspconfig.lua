-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- setup server function
local function setup_server(server_name, filetypes, config)
  lspconfig[server_name].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = filetypes ~= "-" and filetypes or nil,
    -- filetypes = filetypes,
  }, config or {}))
end

lspconfig.servers = {
  "eslint",
  "tailwindcss",
  "html",
  "cssls",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "pyright",
  "sqlls",
}

-- Default Servers
local default_servers = {
  eslint = {
    "javascript",
    "javascriptreact",
    "typescript",
    -- "typescriptreact",
  },
  tailwindcss = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  html = { "html" },
  cssls = { "css", "scss" },
  jsonls = { "json" },
  sqlls = nil,
}

-- Setup default servers
for server, filetypes in pairs(default_servers) do
  setup_server(server, filetypes or "-")
end

--lua specific config
setup_server("lua_ls", { "lua" }, {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

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
