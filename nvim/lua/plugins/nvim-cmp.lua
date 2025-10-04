return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup {
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "buffer"},
        { name = "path" },
      }),

      require("nvim-autopairs").setup({
        check_ts = true,
        map_cr = true,
      }),
    }
  end
}
