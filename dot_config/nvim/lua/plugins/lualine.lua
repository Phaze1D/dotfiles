local CodeCompanionSpinner = require("lualine.component"):extend()

-- Component properties
CodeCompanionSpinner.spinner_index = 1
CodeCompanionSpinner.processing = false

require('lualine').setup({
  options = {
    theme = 'tokyonight'
  },
})
