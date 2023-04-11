vim.g.mapleader = " "
vim.opt.number = true

local opts = { noremap = true }
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.keymap.set('i', '<C-k>', '<C-o>gk', opts)
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-j>', '<C-o>gj', opts)
