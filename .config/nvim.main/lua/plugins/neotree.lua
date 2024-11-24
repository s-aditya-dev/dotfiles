return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require('neo-tree').setup({
			close_if_last_window = false,
			popup_border_style = 'rounded',
			open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
			default_component_configs = {
				icon = {
					folder_closed = ' ',
					folder_open = ' ',
					folder_empty = ' ',
					default = '󰈚',
					highlight = 'NeoTreeFileIcon',
				},
				modified = {
					symbol = '[+] ',
					highlight = 'NeoTreeModified',
				},
				git_status = {
					symbols = {
						-- Change type
						added = '✚',
						modified = '',
						deleted = '',
						renamed = '󰁕',
						-- Status type
						untracked = ' ',
						ignored = '󰿠 ',
						unstaged = ' ',
						staged = ' ',
						conflict = '',
					},
				},
			},
			window = {
				position = 'left',
				width = 40,
			},
		})
	end,
}
