require("lsp.init")
require("config.lazy")

vim.cmd [[colorscheme moonfly]]
vim.cmd [[set cursorline]]

-- Use spaces instead of tabs, tabwidth of 4 spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Use line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
