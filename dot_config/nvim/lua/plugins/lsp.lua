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

local function setupFormatting(event)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = event.buf,
    callback = function()
      local filetype = vim.api.nvim_buf_get_option(event.buf, 'filetype')
      if filetype ~= "markdown" and filetype ~= "markdown.mdx" then
        vim.cmd.undojoin()
        vim.lsp.buf.format({ async = false })
      end
    end,
  })
end


return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      lua_ls = {},
      ts_ls = require('utils.lsp.ts'),
      eslint = require('utils.lsp.eslint'),
      marksman = require('utils.lsp.marksman'),
      jsonls = require('utils.lsp.json'),
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
        setupKeymaps(event)
        setupFormatting(event)
      end,
    })
  end,
}
