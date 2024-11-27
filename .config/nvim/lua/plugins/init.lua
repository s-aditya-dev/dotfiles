local load_dir = require("configs.utils").load_dir

return vim.list_extend(load_dir("plugins.override"), load_dir("plugins.spec"))
