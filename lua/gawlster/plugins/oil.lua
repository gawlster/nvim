require("oil").setup({
	view_options = {
		show_hidden = true
	},
	keymaps = {
		["f"] = "actions.select",
		["q"] = "actions.close",
		["r"] = "actions.refresh",
	}
})

vim.keymap.set("n", "m", require("oil").open, { desc = "Open parent directory" })
