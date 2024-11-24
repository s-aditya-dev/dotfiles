local M = { 'smartinellimarco/nvcheatsheet.nvim' }

M.opts = {
  header = {
    "                                      ",
    "                                      ",
    "                                      ",
    "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
    "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
    "                                      ",
    "                                      ",
    "                                      ",
  },
  keymaps = {},
}



function M.config(_, opts)
    -- Load mappings from mappings.lua
    local mappings = require("core.mappings")

    if not mappings then
        vim.notify("Mappings not found in core.mappings", vim.log.levels.ERROR)
        return
    end

    opts.keymaps = opts.keymaps or {}

    -- Convert mappings to cheatsheet format
    for category, modes in pairs(mappings) do
        local category_keymaps = {}
        for mode, mapping_table in pairs(modes) do
            for key, map in pairs(mapping_table) do
                table.insert(category_keymaps, { map[2], key })
            end
        end
        opts.keymaps[category] = category_keymaps
    end

    -- Setup the cheatsheet plugin
    local nvcheatsheet = require("nvcheatsheet")
    nvcheatsheet.setup(opts)
end

return M
