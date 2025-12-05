local function setupKeymaps(event)
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
  local filetype = vim.api.nvim_buf_get_option(event.buf, 'filetype')

  if filetype ~= "codecompanion" then
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>',
      {
        buffer = event.buf,
        desc = 'Code actions'
      }
    )
  end
end


return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      lua_ls = {},
      sqlls = {},
      ts_ls = {},
      eslint = {},
      marksman = {},
      jsonls = {},
      graphql = {},
      prismals = {},
      dockerls = {},
      docker_compose_language_service = {},
      yamlls = {},
    }
  },
  config = function(_, opts)
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      vim.lsp.enable(server, config)
    end
  end,
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        setupKeymaps(event)
      end,
    })
  end,
}
