vim.opt.splitkeep = "screen"

require('edgy').setup({
  animate = {
    enabled = false,
  },
  right = {
    {
      ft = "terminal",
      size = { width = 0.45 },
    },
  },
})
