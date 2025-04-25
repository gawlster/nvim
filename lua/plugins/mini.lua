return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		-- icons
		require("mini.icons").setup({})

		-- files
		require("mini.files").setup({})
		vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", {desc = "Open file explorer"})

        -- autopairs
        require("mini.pairs").setup({})

        -- indent scope
        local indentscope = require("mini.indentscope")
        indentscope.setup({
            draw = {
                delay = 0,
                animation = indentscope.gen_animation.none()
            }
        })

        -- notifications
        require("mini.notify").setup()

        -- highlight and remove trailing whitespace
        require("mini.trailspace").setup({})
        vim.keymap.set("n", "<leader>w", function()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
        end, { desc = "Remove trailing whitespace" })
	end,
}
