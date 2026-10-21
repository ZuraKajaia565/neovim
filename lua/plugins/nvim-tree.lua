-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				filters = {
					dotfiles = false,
				},
				git = {
					ignore = false,
				},

				renderer = {
					root_folder_modifier = ":t",
				},
			})
		end,
	},
}
