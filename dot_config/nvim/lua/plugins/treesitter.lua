require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "gitcommit",
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
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
