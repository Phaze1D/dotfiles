vim.g.mapleader = " "
vim.o.number = true
vim.opt.clipboard:append('unnamedplus')

local opts = { noremap = true }
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.keymap.set('i', '<C-k>', '<C-o>gk', opts)
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-j>', '<C-o>gj', opts)
