local M = {}

M.load_keybindings = function(keybindings)
  for _, modeTable in pairs(keybindings) do
    if type(modeTable) == "table" then
      for mode, mappings in pairs(modeTable) do
        for key, map in pairs(mappings) do
          if type(map) == "table" and #map >= 2 then
            local opts = { desc = map[2] }

            -- Add additional options (skip numeric keys like 1, 2)
            if #map > 2 then
              for k, v in pairs(map) do
                if type(k) == "string" then
                  opts[k] = v
                end
              end
            end

            -- Set the keymap
            vim.keymap.set(mode, key, map[1], opts)
            -- vim.keymap.set(mode, key, map[1], { desc =  map[2] })
          end
        end
      end
    end
  end
end

return M
