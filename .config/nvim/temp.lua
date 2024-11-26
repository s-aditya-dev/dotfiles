function M.config(_, opts)
  -- Load mappings from mappings.lua
  local ok, mappings = pcall(require, "lua.mappings")
  if not ok or type(mappings) ~= "table" then
    vim.notify(
      "Error loading mappings from lua.keymaps. Ensure the file exists and is formatted correctly.",
      vim.log.levels.ERROR
    )
    return
  end

  opts.keymaps = opts.keymaps or {}

  -- Convert mappings to cheatsheet format
  for category, modes in pairs(mappings) do
    local category_keymaps = {}
    for _, mapping_table in pairs(modes) do
      for key, map in pairs(mapping_table) do
        table.insert(category_keymaps, { map[2], key })
      end
    end
    opts.keymaps[category] = category_keymaps
  end

  -- Setup the cheatsheet plugin
  local ok_nvcheatsheet, nvcheatsheet = pcall(require, "nvcheatsheet")
  if not ok_nvcheatsheet then
    vim.notify("nvcheatsheet plugin not found. Please install it.", vim.log.levels.ERROR)
    return
  end
  nvcheatsheet.setup(opts)

  -- Apply the highlights
  local highlights = M.highlight(customPalette)
  for group, color in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, color)
  end
end
