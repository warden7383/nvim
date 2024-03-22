return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugin.treesitter")
    end,
    -- Initial: lazy false, no lazy event
    lazy = true, 
    event = {"BufReadPre", "BufAdd"},
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    cmd = "Telescope",
    config = function()
      require("plugin.telescope")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make'
  },

  --FIX does not work
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = true,
  },

  {
    'windwp/nvim-autopairs',
    -- NOTE: a dependency for nvim-cmp when nvimlsp is loaded
    --
    event = {"BufReadPre", "BufAdd"},
    opts = {}, -- this is equalent to setup({}) function
    -- lazy = true,
  },

  {
    'numToStr/Comment.nvim',
    event = {"BufReadPre", "BufAdd"},
    opts = {
    },
    config = function()
      require('Comment').setup()
    end,
    lazy = true,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      vim.g.skip_ts_context_commentstring_module = true
    end,
    lazy = true,
    -- Set vim.g.skip_ts_context_commentstring_module = true somewhere in your 
    -- configuration to skip backwards compatibility routines and speed up loading.
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "DD", ":TroubleToggle document_diagnostics<CR>", desc = "toggle diagnostics", silent = true},
    },
    config = function()
      vim.keymap.set('n', 'DD', ':TroubleToggle document_diagnostics<CR>', {silent = true, desc = "Toggle diagnostics"}) -- enable when trouble.nvim exists
    end,
    lazy = true,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = {"BufReadPre", "BufAdd"},
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function ()
      require("plugin.todoComments")
    end,
    lazy = true,
  },

  {
    "andymass/vim-matchup",
    event = {"BufReadPre", "BufAdd"},
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup"}
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = {"BufReadPre", "BufAdd"},
    keys = { 
      { "<C-d>", desc = "Neoscroll down" },
      { "<C-u>", desc = "Neoscroll up" },
    },
    config = function ()
      require("plugin.neoscroll")
    end,
    lazy = true,
  },

  {
    "RRethy/vim-illuminate",
    event = {"BufReadPre", "BufAdd"},
    lazy = true,
    config = function()
      require("plugin.illuminate")
    end,
  },

}
