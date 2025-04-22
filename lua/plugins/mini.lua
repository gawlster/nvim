return { 
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		-- icons
		require("mini.icons").setup({})

		-- files
		require("mini.files").setup({})
		vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", {desc = "Open file explorer"})
	end,
}
