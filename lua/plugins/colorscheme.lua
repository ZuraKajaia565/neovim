--
-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
