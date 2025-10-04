return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        --python
        null_ls.builtins.diagnostics.ast_grep,

        --js/ts 
        null_ls.builtins.diagnostics.ast_grep,

        --C
        null_ls.builtins.diagnostics.ast_grep,
        
        --Rust
        null_ls.builtins.diagnostics.ast_grep,

      },
    })
  end,



}
