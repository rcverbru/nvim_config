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
   {
    'brianhuster/live-preview.nvim',
    dependencies = {
      -- You can choose one of the following pickers
      'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'echasnovski/mini.pick',
		  -- 'folke/snacks.nvim',
    },
    config = function()
      -- Setup live-preview (optional config)
      -- require('livepreview.config').set({})
      -- Add keymaps for live preview - using vim.schedule to ensure plugin is loaded
      vim.schedule(function()
        vim.keymap.set('n', '<leader>lp', '<cmd>LivePreview start<cr>', { desc = "Live Preview Start" })
        vim.keymap.set('n', '<leader>lpp', '<cmd>LivePreview pick<cr>', { desc = "Live Preview Pick" })
        vim.keymap.set('n', '<leader>lpc', '<cmd>LivePreview close<cr>', { desc = "Live Preview Close" })
      end)
    end,
  },
}
