return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  enabled = true,
  config = function()
    require("tokyonight").setup({
      style = "moon", -- "storm", "night", "day"
      transparent = true,
      terminal_colors = true,
    })
    vim.cmd([[colorscheme tokyonight-moon]])
  end,
}
