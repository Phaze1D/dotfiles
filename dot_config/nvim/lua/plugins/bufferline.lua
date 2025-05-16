return {
  "akinsho/bufferline.nvim",
  event = { "BufNewFile", "BufReadPost" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = '󰙅  File Explorer',
          separator = true,
        }
      }
    },
  },
  keys = {
    { "<TAB>",      ":BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-Tab>",    ":BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "<leader>bp", ":BufferLinePick<CR>",      desc = "Pick buffer" },
    { "<leader>bd", ":bd<CR>",                  desc = "Delete buffer" },
  }
}
