require("lsp.lua-language-server")
require("lsp.typescript-language-server")
require("lsp.prettier")

vim.keymap.set("n", "grp", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic float" })
