return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "html",
        "cssls",
        "ts_ls",
        "rust_analyzer",
        "ada_language_server",
        "hls",
        "ast_grep",
        "gopls"
      },
    }

    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server in ipairs({
      "lua_ls", "clangd", "pyright",
      "html", "cssls", "ts_ls",
      "rust_analyzer", "hls"
    }) do
      lspconfig[server].setup { capabilities = capabilities }
    end

    -- Lua tweaks
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    -- Register Ada server if it’s not already known
    if not configs.als then
      configs.als = {
        default_config = {
          cmd = { "ada_language_server" },
          filetypes = { "ada" },
          root_dir = lspconfig.util.root_pattern("*.gpr", ".git"),
          settings = {},
        },
      }
    end

    -- Setup Ada
    lspconfig.als.setup {
      capabilities = capabilities,
    }
  end,
}


