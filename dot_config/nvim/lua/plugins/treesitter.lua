return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
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
  end
}
