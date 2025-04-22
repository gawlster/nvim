local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  "Mofiqul/dracula.nvim",
  "nvim-lua/plenary.nvim",
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
    end,
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
  },
--  {
--    'VonHeikemen/lsp-zero.nvim',
--    branch = 'v3.x',
--    dependencies = {
      {'neovim/nvim-lspconfig'},             -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/nvim-cmp'},         -- Required
--      {'L3MON4D3/LuaSnip'},             -- Required
--
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- {'hrsh7th/cmp-buffer'},       -- Optional
      -- {'hrsh7th/cmp-path'},         -- Optional
      -- {'saadparwaiz1/cmp_luasnip'}, -- Optional
      -- {'hrsh7th/cmp-nvim-lua'},     -- Optional
      -- {'rafamadriz/friendly-snippets'}, -- Optional
--    }
--  },
})

vim.cmd[[colorscheme dracula]]
