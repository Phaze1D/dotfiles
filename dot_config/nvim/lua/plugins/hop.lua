require("hop").setup()

vim.keymap.set({ 'n', 'v' }, 'sw', ':HopWord<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'sl', ':HopLine<CR>', { noremap = true })

vim.keymap.set({ 'n', 'v' }, 'fw', ':HopWordCurrentLine<CR>', { noremap = true })
