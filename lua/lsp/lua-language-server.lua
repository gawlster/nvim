vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.start({
      name = "lua-language-server",
      cmd = { "lua-language-server" },
    })
  end,
})
