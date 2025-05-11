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
    packages = { enable = false },
    shortcut = {
      {
        desc = '󰊳 Update',
        group = '@property',
        action = 'PlugUpdate',
        key = 'u',
      },
      {
        icon = '󰈙 ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = '󰊢 ',
        icon_hl = '@variable',
        desc = 'Git Files',
        group = 'Label',
        action = 'Telescope git_files',
        key = 'a',
      },
      {
        icon = '󰩈 ',
        icon_hl = '@variable',
        desc = 'Quit',
        group = '@property',
        action = 'quit',
        key = 'q',
      },
    },
    footer = {
      '',
      ' 🚀 Get To It.',
    }
  }
})
