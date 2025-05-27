return {
  'nvim-flutter/flutter-tools.nvim',
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  config = true,
  opts = {
    decorations = {
      statusline = {
        app_version = true,
        device = true,
        project_config = false,
      }
    },
  },
}
