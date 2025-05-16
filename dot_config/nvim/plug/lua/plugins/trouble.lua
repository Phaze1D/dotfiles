require('trouble').setup({
  auto_preview = false,
  modes = {
    errors_diao = {
      mode = 'diagnostics',
      filter = {
        severity = vim.diagnostic.severity.ERROR
      },
    },
    warning_diao = {
      mode = 'diagnostics',
      filter = {
        buf = 0,
        any = {
          { severity = vim.diagnostic.severity.WARN },
          { severity = vim.diagnostic.severity.HINT },
        },
      }
    },
    info_diao = {
      mode = 'diagnostics',
      filter = {
        severity = vim.diagnostic.severity.INFO
      },
    },
  },
})

local map = vim.keymap.set

-- Toggle trouble window with different modes
map("n", "<leader>xe", function() require("trouble").toggle('errors_diao') end, { desc = "Errors Diagnostics" })
map("n", "<leader>xw", function() require("trouble").toggle('warning_diao') end, { desc = "Warning Diagnostics" })
map("n", "<leader>xi", function() require("trouble").toggle('info_diao') end, { desc = "Info Diagnostics" })
