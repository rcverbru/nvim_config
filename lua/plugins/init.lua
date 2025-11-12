return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  { "rafamadriz/friendly-snippets" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = false,
    dependencies = {
      -- Treesitter provider for TypeScript/TSX when LSP doesn't support documentSymbol
      "epheien/outline-treesitter-provider.nvim",
    },
    config = function()
      require("outline").setup({
        -- Configure providers - prioritize treesitter for TypeScript/TSX since tsgo doesn't support documentSymbol
        providers = {
          -- Try treesitter first, then LSP as fallback
          priority = { 'treesitter', 'lsp', 'coc', 'markdown', 'norg', 'man' },
          lsp = {
            -- Don't blacklist tsgo, but treesitter will be used first
            blacklist_clients = {},
          },
        },
      })
    end,
  },
}
