return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
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
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xe",
      function() require("trouble").toggle('errors_diao') end,
      desc = "Errors Diagnostics"
    },
    {
      "<leader>xw",
      function() require("trouble").toggle('warning_diao') end,
      desc = "Warning Diagnostics"
    },
    {
      "<leader>xi",
      function() require("trouble").toggle('info_diao') end,
      desc = "Info Diagnostics"
    },
  },
}
