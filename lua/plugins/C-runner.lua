vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.keymap.set("n", "<leader>r", function()
			vim.cmd("write")
			vim.cmd("botright 10split | term gcc % -o %:r && ./%:r")
		end, { buffer = true, desc = "Run C File" })
	end,
})
