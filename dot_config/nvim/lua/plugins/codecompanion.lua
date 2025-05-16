local M = {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,
    },
    display = {
      diff = {
        provider = "mini_diff", -- default|mini_diff
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "github/copilot.vim",
  },
  init = function()
    vim.keymap.set('i', '<C-;>', 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false
    })

    vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", {
      noremap = true,
      silent = true
    })

    vim.cmd([[cab cc CodeCompanion #buffer /commit]])

    vim.g.copilot_no_tab_map = true
  end
};


return M
