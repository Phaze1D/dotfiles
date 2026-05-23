return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "yaml", "javascript", "typescript", "tsx", "dart",
      "graphql", "json", "dockerfile", "css", "lua",
      "sql", "html", "markdown", "markdown_inline", "prisma",
    }

    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end
}
