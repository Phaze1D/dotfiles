require('nvim-tree').setup({
  view = {
  },
  filters = {
    dotfiles = false
  }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true })
