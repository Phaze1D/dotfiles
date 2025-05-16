return {
  "neovim/nvim-lspconfig",
  dependencies = {
  },
  init = function()
    local lspconfig = require('lspconfig')

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
          {
            buffer = event.buf,
            desc = 'Show hover documentation'
          }
        )
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

    lspconfig.ts_ls.setup({})
    lspconfig.dockerls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.graphql.setup({
      filetypes = {
        "graphql",
        "gql",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
      }
    })
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
}
