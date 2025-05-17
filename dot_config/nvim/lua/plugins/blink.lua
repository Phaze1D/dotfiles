return {
  'saghen/blink.cmp',

  version = '1.*',
  opts = {
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },

      ['<C-u>'] = { 'scroll_documentation_up', },
      ['<C-d>'] = { 'scroll_documentation_down', },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',
    },
    cmdline = {
      keymap = {
        preset = 'inherit',
        ['<Tab>'] = { 'show', 'show_documentation', 'hide_documentation' },
      }
    },
    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      menu = {
        draw = {
          treesitter = { 'lsp' },
          window = { border = "rounded" },
        }
      },
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
      list = {
        selection = {
          auto_insert = false,
          window = { border = "rounded" },

        }
      }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
