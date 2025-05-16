return {
  "neovim/nvim-lspconfig",
  dependencies = {
  },
  init = function()
    vim.lsp.enable('lua_ls')

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
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    })
  end,
}
