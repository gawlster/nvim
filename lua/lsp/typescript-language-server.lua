vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		callback = function()
			root_dir = vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true })[1]
			if not root_dir then return end
			vim.lsp.start({
				name = "typescript-language-server",
				cmd = { "typescript-language-server", "--stdio" },
				root_dir = vim.fs.dirname(root_dir)
			})
		  end,
})
