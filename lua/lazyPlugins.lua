return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("plugin.tokyonight")
    end,
    priority = 1000,
    opts = {},
  },

  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugin.treesitter")
    end,
  },

  { 
    "nvim-tree/nvim-web-devicons", 
    config = function()
      require("plugin.webdevicons")
    end,
    lazy = true, 
  },

  { "nvim-lua/plenary.nvim" },

  {
    "nvim-tree/nvim-tree.lua",
    event = "BufEnter",
    config = function() 
      require("plugin.nvimtree")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    config = function()
      require("plugin.telescope")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'make'
  },

  { 
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood",
    verylazy = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("plugin.lualine")
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  --FIX does not work
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    verylazy = true,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    verylazy = true,
  },

  {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    opts = {
    },
    config = function()
      require('Comment').setup()
    end,
    lazy = true,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = "BufEnter",
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
      { "DD", ":TroubleToggle document_diagnostics<CR>", desc = "toggle diagnostics"},
    },
    config = function()
      vim.keymap.set('n', 'DD', ':TroubleToggle document_diagnostics<CR>', {silent = true}) -- enable when trouble.nvim exists
    end,
    lazy = true,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "InsertEnter",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = true,
  },

  { 
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl", 
    opts = {},
    config = function()
      require("plugin.indent-blankline")
    end,
    lazy = true,
  },

  {
    "andymass/vim-matchup",
    event = "BufEnter",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup"}
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    config = function ()
      require('neoscroll').setup {}
    end,
    lazy = true,
  },

  {
    "dstein64/nvim-scrollview",
    event = "BufEnter",
    config = function()
      require("scrollview").setup{}
    end,
    lazy = true,
  },
}
