local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("gawlster.lsp.mason")
require("gawlster.lsp.handlers").setup()
require("gawlster.lsp.null-ls")
require("gawlster.lsp.prettier")
