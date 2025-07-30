local M = {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  opts = {
    adapters = {
      tavily = function()
        return require("codecompanion.adapters").extend("tavily", {
          env = {
            api_key = "MISSING_TAVILY_API_KEY",
          },
        })
      end,
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4.1",
            },
          },
        })
      end,
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        provider = "snacks",
        opts = {
          show_default_actions = true,
          show_default_prompt_library = true,
        },
      },
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

    vim.cmd([[cab cc CodeCompanion #{buffer} write a commit message]])

    vim.g.copilot_no_tab_map = true
  end
};


return M
