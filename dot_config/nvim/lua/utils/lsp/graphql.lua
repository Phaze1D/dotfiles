local util = require 'lspconfig.util'

return {
  cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
  filetypes = { 'graphql', 'gql' },
  root_dir = function(fname)
    return util.root_pattern('.graphqlrc*', '.graphql.config.*', 'graphql.config.*')(fname)
  end,
}
