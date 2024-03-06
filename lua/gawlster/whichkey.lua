local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-j>", -- binding to scroll down inside the popup
		scroll_up = "<c-k>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	-- triggers = { "<leader>" },                                                   -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		n = { "j", "k" },
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment" },
	j = { ":move .+1<CR>==", "Move down" },
	k = { ":move .-2<CR>==", "Move up" },
	p = { '"+p', "Paste" },
	y = { '"+y', "Yank" },
	n = { "<cmd>nohlsearch<CR>", "No Highlight" },
	x = { "<cmd>Bdelete!<cr>", "Close buffer" },
	f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
	b = {
		name = "Buffers",
		f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer find" },
		x = { "<cmd>%bd|e#|bd#<cr>", "Close other buffers" },
	},
	m = {
		name = "Project",
		s = { "<cmd>Telescope live_grep<cr>", "Search" },
		f = { "<cmd>Telescope find_files<cr>", "Files" },
	},
	F = {
		name = "Folds",
		o = { "zr", "Open one level" },
		O = { "zR", "Open all" },
		c = { "zm", "Fold one level" },
		C = { "zM", "Fold all" },
		f = { "za", "Toggle Fold" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		i = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Issue" },
		I = { "<cmd>Telescope diagnostics<cr>", "File issues" },
		n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		o = {
			function()
				require("typescript").actions.addMissingImports({ sync = true })
				require("typescript").actions.removeUnused({ sync = true })
				require("typescript").actions.organizeImports({ sync = true })
			end,
			"Organize imports",
		},
	},
	g = {
		name = "Git",
		g = { '<cmd>silent !tmux neww "lazygit"<cr>', "Lazygit" },
		s = { "<cmd>Telescope git_status<cr>", "Status" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	h = {
		name = "Harpoon",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add" },
		h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },
	},
}

if string.find(vim.fn.getcwd(), "/home/gawlster/notes") then
	local neorgMaps = {
		o = {
			name = "Neorg",
			c = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>", "Edit code block" },
			w = {
				name = "Workspaces",
				s = { "<cmd>Neorg workspace school<cr>", "School" },
				p = { "<cmd>Neorg workspace personal<cr>", "Personal" },
			},
			s = {
				name = "Settings",
				t = { "<cmd>Neorg toggle-concealer<cr>", "Toggle Concealer" },
			},
			j = {
				name = "Journal",
				t = { "<cmd>Neorg journal today<cr>", "Today" },
				y = { "<cmd>Neorg journal yesterday<cr>", "Yesterday" },
				m = { "<cmd>Neorg journal tomorrow<cr>", "Tomorrow" },
				c = { "<cmd>Neorg journal custom<cr>", "Custom (yyyy-mm-dd)" },
				j = { "<cmd>Neorg journal toc update<cr><cmd>Neorg journal toc open<cr>", "List" },
			},
		},
	}
	table.insert(mappings, neorgMaps)
end

local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = {
		function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end,
		"Comment",
	},
	j = { ":move '>+1<CR>gv-gv", "Move down" },
	k = { ":move '<-2<CR>gv-gv", "Move up" },
	p = { '"+p', "Paste" },
	y = { '"+y', "Yank" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
