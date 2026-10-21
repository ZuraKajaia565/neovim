return {
	"nvimtools/none-ls.nvim", -- or 'jose-elias-alvarez/null-ls.nvim' if you prefer
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local nls = require("null-ls")
		nls.setup({
			sources = {
				-- diagnostics
				nls.builtins.diagnostics.flake8,
				nls.builtins.diagnostics.cppcheck,
				-- formatting
				nls.builtins.formatting.black,
				nls.builtins.formatting.clang_format,
			},
		})
	end,
}
