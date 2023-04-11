local Plug = require('plug')

Plug.begin('~/.config/nvim/plugged')

Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('phaazon/hop.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
Plug('glepnir/dashboard-nvim')

Plug.ends()