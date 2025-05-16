local config_path = vim.fn.stdpath('config')
local header_path = config_path .. '/lua/header.txt'

local width = 49

return {
  preset = {
    keys = {
    },
  },
  sections = {
    {
      section = "terminal",
      cmd = "lolcat " .. header_path,
      height = 22,
      width = 47,
    },
    {
      section = "keys",
      gap = 1,
      padding = 1,
      {
        text = {
          { "  ", hl = "SnacksDashboardIcon" },
          {
            "Find File",
            hl = "SnacksDashboardDesc",
            width = width
          },
          { "[f]", hl = "SnacksDashboardKey" },
        },
        action = ":lua Snacks.dashboard.pick('smart')",
        key = 'f',
      },
      {
        text = {
          { "  ", hl = "SnacksDashboardIcon" },
          {
            "Find Text",
            hl = "SnacksDashboardDesc",
            width = width
          },
          { "[g]", hl = "SnacksDashboardKey" },
        },
        action = ":lua Snacks.dashboard.pick('live_grep')",
        key = 'g',
      },
      {
        text = {
          { " ", hl = "SnacksDashboardIcon" },
          {
            "Recent Files",
            hl = "SnacksDashboardDesc",
            width = width
          },
          { "[r]", hl = "SnacksDashboardKey" },
        },
        action = ":lua Snacks.dashboard.pick('oldfiles')",
        key = 'r',
      },
      {
        text = {
          { " ", hl = "SnacksDashboardIcon" },
          {
            "Sessions",
            hl = "SnacksDashboardDesc",
            width = width
          },
          { "[s]", hl = "SnacksDashboardKey" },
        },
        action = function() require("persistence").select() end,
        key = 's',
      },

      -- { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      -- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
    -- { section = "startup" },
  },
}
