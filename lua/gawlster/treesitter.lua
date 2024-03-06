local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = {
    "css",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "latex",
    "lua",
    "markdown",
    "sql",
    "typescript",
    "yaml",
    "python",
  },
  sync_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,        -- false will disable the whole extension
    disable = { "" },     -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {} },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = { __default = "// %s", __multiline = "/* %s */" },
    },
  },
})
