require'lspconfig'.tsserver.setup({})
require'lspconfig'.graphql.setup({
  filetypes = { "graphql", "gql", "typescript", "javascript", "typescriptreact", "javascriptreact" }
})
