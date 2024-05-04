local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Indent lines in visual mode and keep selection
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Center the cursor when jumping up, down, and cycling search results
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("v", "<C-d>", "<C-d>zz", opts)
keymap("v", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Allow alt-backspace to delete a word
keymap("i", "<C-H>", "<C-w>", opts)
keymap("c", "<C-H>", "<C-w> a<BS>", opts)

-- Tmux sessions
keymap("n", "<C-f>", "<cmd>silent !tmux neww /home/gawlster/.scripts/tmuxsessionizer.sh<CR>", opts)
keymap("v", "<C-f>", "<cmd>silent !tmux neww /home/gawlster/.scripts/tmuxsessionizer.sh<CR>", opts)
