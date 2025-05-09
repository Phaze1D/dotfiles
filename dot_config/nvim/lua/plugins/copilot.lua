require("codecompanion").setup({
  adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-3.7-sonnet",
          },
        },
      })
    end,
  }
})

vim.keymap.set('i', '<C-;>', 'copilot#Accept("")', {
  expr = true,
  replace_keycodes = false
})

vim.g.copilot_no_tab_map = true
