return {
  "shaunsingh/moonlight.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  enabled = false,
  config = function()
    vim.cmd([[colorscheme moonlight]])
  end,
}
