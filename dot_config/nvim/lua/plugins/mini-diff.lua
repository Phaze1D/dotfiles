return {
  'echasnovski/mini.diff',
  event = { "BufReadPre", "BufNewFile" },
  version = '*',
  config = function()
    local diff = require("mini.diff")
    diff.setup {
      source = diff.gen_source.none(),
    }
  end,
}
