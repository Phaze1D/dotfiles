return {
  "lukas-reineke/lsp-format.nvim",
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        print("LSP client attached: " .. client.name)

        if client.name ~= "ts_ls" then
          require("lsp-format").on_attach(client, args.buf)
        end
      end,
    })
  end,
}
