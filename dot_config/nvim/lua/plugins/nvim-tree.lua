require('nvim-tree').setup({
  view = {
  },
  filters = {
    dotfiles = false
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true })
