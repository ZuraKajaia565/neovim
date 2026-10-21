-- ~/.config/nvim/lua/plugins/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
local org = "org.eclipse.jdt.ls.core.id1"
require("lazy").setup({
	{ import = "plugins.lsp" },
	{ import = "plugins.telescope" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.colorscheme" },
	{ import = "plugins.autopairs" },
	{ import = "plugins.comment" },
	{ import = "plugins.toggleterm" },
	{ import = "plugins.nvim-tree" },
	{ import = "plugins.mason" },
	{ import = "plugins.null-ls" },
	{ import = "plugins.dap" },
	{ import = "plugins.conform" },
	{ import = "plugins.typst" },
	{ import = "plugins.cmp" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.mini" },
	{ import = "plugins.pdfReader" },
	{ import = "plugins.C-runner" },
	{ import = "plugins.dadbod" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
