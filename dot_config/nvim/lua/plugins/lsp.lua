return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      lua_ls = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
  init = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
          {
            buffer = event.buf,
            desc = 'Show signature help'
          }
        )
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>',
          {
            buffer = event.buf,
            desc = 'Rename symbol'
          }
        )
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>',
          {
            buffer = event.buf,
            desc = 'Code actions'
          }
        )

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = event.buf,
          callback = function()
            vim.cmd.undojoin()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    })
  end,
}
