return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { 'alpha' }, -- Prevent lualine in these filetypes
          winbar = { 'neo-tree', 'dap-repl' }, -- Prevent per-window status bars
        },
        always_divide_middle = true,
        globalstatus = true, -- Use a global status line
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return ' ' .. str
            end,
          },
        },
        lualine_b = {
          {
            function()
              if vim.bo.filetype == 'neo-tree' then
                return 'NeoTree'
              else
                return vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:t') or '[No Name]'
              end
            end,
          },
        },
        lualine_c = {
          {
            "branch",
            icon = "󰘬",
          } 
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = false,
            update_in_insert = false,
            always_visible = false,
            cond = function()
              return vim.fn.winwidth(0) > 100
            end,
          },
          {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            cond = function()
              return vim.fn.winwidth(0) > 100
            end,
          },
          {
            'filetype',
            cond = function()
              return vim.fn.winwidth(0) > 100
            end,
          },
        },
        lualine_y = {
          {
            function()
              return '󰉋 ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            
          },
        },
        lualine_z = {
          {
            'progress',
            fmt = function(str)
              return ' ' .. str
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive', 'nvim-tree', 'quickfix' },
    }
  end,
}
