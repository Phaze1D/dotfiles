require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "yaml",
    "javascript",
    "typescript",
    "tsx",
    "graphql",
    "json",
    "dockerfile",
    "css",
    "lua",
    "html",
    "dart",
  },
  sync_install = false,
  auto_install = false,
  ignore_install = { "gitcommit" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
