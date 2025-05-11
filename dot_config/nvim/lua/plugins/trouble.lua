require('trouble').setup({
  auto_preview = false,
  modes = {
    errors_diao = {
      mode = 'diagnostics',
      filter = {
        buf = 0,
        severity = vim.diagnostic.severity.ERROR
      },
    },
    warning_diao = {
      mode = 'diagnostics',
      filter = {
        buf = 0,
        ['not'] = { severity = vim.diagnostic.severity.ERROR },
      }
    }
  },
})

local map = vim.keymap.set

-- Toggle trouble window with different modes
map("n", "<leader>xe", function() require("trouble").toggle('errors_diao') end, { desc = "Errors Diagnostics" })
map("n", "<leader>xw", function() require("trouble").toggle('warning_diao') end, { desc = "Warning Diagnostics" })
map("n", "<leader>xq", function() require("trouble").toggle('qflist') end, { desc = "Quick Fix" })
