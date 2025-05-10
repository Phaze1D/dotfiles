local config_path = vim.fn.stdpath('config')
local header_path = config_path .. '/lua/header.txt'

require('dashboard').setup({

  theme = 'hyper',
  preview = {
    command = 'lolcat',
    file_path = header_path,
    file_height = 22,
    file_width = 50,
  },
  config = {
    shortcut = {
      {
        desc = '󰊳 Update',
        group = '@property',
        action = 'PlugUpdate',
        key = 'u',
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Git Files',
        group = 'DiagnosticHint',
        action = 'Telescope git_files',
        key = 'a',
      },
    },
  }
})
