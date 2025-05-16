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

vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", {
  noremap = true,
  silent = true
})

vim.cmd([[cab cc CodeCompanion]])
vim.cmd([[cab cm CodeCompanion #buffer /commit]])

vim.g.copilot_no_tab_map = true
