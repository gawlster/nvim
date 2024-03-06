local status_ok, oil = pcall(require, "oil")
if not status_ok then
  print("Error setting up oil.nvim")
  return
end

oil.setup({
  view_options = {
    show_hidden = true
  },
  keymaps = {
    ["s"] = "actions.select",
    ["q"] = "actions.close",
    ["r"] = "actions.refresh",
  }
})

vim.keymap.set("n", "m", require("oil").open, { desc = "Open parent directory" })
