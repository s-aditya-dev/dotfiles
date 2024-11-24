local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require "null-ls"

-- Table of file types and specific filenames/extensions to ignore
local ignored_filetypes = { "env" }                                   -- Add file types here
local ignored_filenames = { ".env", ".env.local", ".env.production" } -- Add specific file names here

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
  },
  on_attach = function(client, bufnr)
    -- Get file type and name
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local filename = vim.api.nvim_buf_get_name(bufnr):match "^.+/(.+)$"

    -- Skip formatting for ignored file types or specific filenames
    if vim.tbl_contains(ignored_filetypes, filetype) or vim.tbl_contains(ignored_filenames, filename) then
      return
    end

    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
