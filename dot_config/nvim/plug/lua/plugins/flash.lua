local flash = require('flash')
flash.setup({
  modes = {
    char = {
      jump_labels = true
    },
  },
})

vim.keymap.set({ "n", "x", "o" }, "s", function()
  flash.jump({
    search = {
      mode = function(str)
        return "\\<" .. str
      end,
    },
  })
end, { desc = "Flash", noremap = true })
vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter", noremap = true })
vim.keymap.set("o", "r", flash.remote, { desc = "Remote Flash", noremap = true })
vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search", noremap = true })
vim.keymap.set("c", "<c-s>", flash.toggle, { desc = "Toggle Flash Search", noremap = true })
