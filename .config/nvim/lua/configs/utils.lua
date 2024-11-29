local M = {}

M.load_config = function()
  M.load_keybindings(require("mappings"))
  require("cmd-mappings")
  require("options")
  require("nvchad.autocmds")
  M.load_dir("configs.init_load")
  require("incline").disable()
end

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

M.load_dir = function(dir)
  local modules = {}
  local base_dir = vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/")
  for file in io.popen('ls "' .. base_dir .. '"'):lines() do
    if file:match("%.lua$") then
      local module_name = dir .. "." .. file:gsub("%.lua$", "")
      table.insert(modules, require(module_name))
    end
  end
  return modules
end

return M
