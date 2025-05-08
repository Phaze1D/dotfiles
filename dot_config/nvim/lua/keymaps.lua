vim.g.mapleader = " "
vim.opt.clipboard:append('unnamedplus')
vim.opt.number = true
vim.opt.splitright = true
local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

local opts = { noremap = true }
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.keymap.set('i', '<C-k>', '<C-o>gk', opts)
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-j>', '<C-o>gj', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
