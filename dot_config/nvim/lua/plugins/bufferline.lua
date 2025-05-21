return {
  "akinsho/bufferline.nvim",
  event = { "BufNewFile", "BufReadPost" },
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup {
      options = {
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = 'snacks_layout_box',
            text = '󰙅  File Explorer',
            separator = true,
          }
        }
      },

    }
  end,
  keys = {
    { "<TAB>",      function() require("bufferline").cycle(1) end,  desc = "Next buffer" },
    { "<S-Tab>",    function() require("bufferline").cycle(-1) end, desc = "Previous buffer" },
    { "<leader>bp", function() require("bufferline").pick() end,    desc = "Pick buffer" },
  }
}
