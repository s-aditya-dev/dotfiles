local Utils = {}

Utils.load_keybindings = function(keybindings)
  for category, modeTable in pairs(keybindings) do
    if type(modeTable) == "table" then
      for mode, mappings in pairs(modeTable) do
        for key, map in pairs(mappings) do
          if type(map) == "table" and #map >= 2 then
            vim.keymap.set(mode, key, map[1], { desc = map[2] })
          end
        end
      end
    end
  end
end

return Utils
