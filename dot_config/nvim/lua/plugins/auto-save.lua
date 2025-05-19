return {
  "okuuva/auto-save.nvim",
  version = '^1.0.0',
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    enabled = true,
    trigger_events = { -- See :h events
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
    condition = nil,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    noautocmd = false,         -- do not execute autocmds when saving
    lockmarks = false,         -- lock marks when saving, see `:h lockmarks` for more details
    debounce_delay = 500,      -- delay after which a pending save is executed
    debug = false,

  }
}
