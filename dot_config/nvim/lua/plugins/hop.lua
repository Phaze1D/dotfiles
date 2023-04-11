require("hop").setup()

vim.keymap.set('n', 'fw', ':HopWord<CR>', { noremap = true })
vim.keymap.set('n', 'fl', ':HopLine<CR>', { noremap = true })