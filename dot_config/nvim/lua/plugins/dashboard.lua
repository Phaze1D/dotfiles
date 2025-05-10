require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
      "",
      " ██████╗ ██╗   ██╗██╗███╗   ██╗ ██████╗ ",
      " ██╔═══██╗██║   ██║██║████╗  ██║██╔═══██╗",
      " ██║   ██║██║   ██║██║██╔██╗ ██║██║   ██║",
      " ██║   ██║██║   ██║██║██║╚████╔╝██║   ██║",
      " ╚██████╔╝╚██████╔╝██║██║ ╚═══╝ ╚██████╔╝",
      "  ╚═════╝  ╚═════╝ ╚═╝╚═╝        ╚═════╝ ",
    },
    center = {
      {
        icon = '  ',
        desc = 'Recently latest session                   ',
        action = 'SessionLoad',
        shortcut = 'SPC s l'
      },
      {
        icon = '  ',
        desc = 'Recently opened files                    ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC f o'
      },
      {
        icon = '  ',
        desc = 'Find file                                ',
        action = 'Telescope find_files',
        shortcut = 'SPC f f'
      },
    },
    footer = { 'Get to it' },
  }
})
