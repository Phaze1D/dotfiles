local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false,
  })
end)

lspconfig.tsserver.setup({})
lspconfig.dockerls.setup({})
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.graphql.setup({
  filetypes = { "graphql", "gql", "typescript", "javascript", "typescriptreact", "javascriptreact" }
})
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
lsp.setup()
