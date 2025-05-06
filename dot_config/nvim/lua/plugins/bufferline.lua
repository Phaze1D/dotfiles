vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  },
})

local opts = { noremap = true }
vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
