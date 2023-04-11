require('nvim-tree').setup({
  view = {
    auto_resize = true
  }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true })