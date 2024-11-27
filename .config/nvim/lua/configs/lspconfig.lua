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
}

-- Default Servers
local default_servers = {
  {
    name = "eslint",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  },
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

