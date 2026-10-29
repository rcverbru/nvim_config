return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "nvchad.configs.treesitter"
      vim.list_extend(opts.ensure_installed, { "html", "css", "cpp", "c", "qmljs" })
      return opts
    end,
  },

  {
    "toppair/peek.nvim",
    lazy = false,
    build = "deno task --quiet build:fast",
    config = function()
      local peek = require("peek")
      peek.setup({
        -- Attempt to auto-detect browser
        app = "google-chrome"
      })

      vim.api.nvim_create_user_command("PeekOpen", function()
        peek.open()
      end, {})

      vim.api.nvim_create_user_command("PeekClose", function()
        peek.close()
      end, {})
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
      'ibhagwan/fzf-lua',
      'echasnovski/mini.pick',
      'folke/snacks.nvim',
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

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        snacks_win_opts = {
          keys = {
            -- <C-q> leaves terminal mode so you can scroll the history (k, <C-u>, gg, /search).
            -- Press i or a to go back to typing in Claude.
            claude_normal = { "<C-q>", "<C-\\><C-n>", mode = "t", desc = "Terminal normal mode" },
          },
        },
      },
    },
    init = function()
      -- keep far more terminal history than the 10k-line default (100k is nvim's max)
      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function()
          vim.opt_local.scrollback = 100000
        end,
      })
    end,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
