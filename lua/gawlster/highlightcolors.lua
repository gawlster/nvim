local status_ok, hc = pcall(require, "nvim-highlight-colors")
if not status_ok then
	return
end

hc.setup({
	enable_tailwind = true,
})
