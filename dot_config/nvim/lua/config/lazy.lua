-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard:append('unnamedplus')
vim.opt.number = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'

local o = vim.o
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, desc = "Disable space" })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, desc = "Move cursor up" })
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, desc = "Move cursor left" })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, desc = "Move cursor right" })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, desc = "Move cursor down" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = "Exit terminal mode" })


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight-moon" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
