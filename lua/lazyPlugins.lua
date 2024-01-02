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
    lazy = true,
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
    lazy = true,
  },

  {
    'windwp/nvim-autopairs',
    -- NOTE: a dependency for nvim-cmp when nvimlsp is loaded
    --
    -- event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    -- lazy = true,
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

  {
    'famiu/bufdelete.nvim',
    keys = {
      {"<leader>q", ":Bdelete<CR>", desc = "Delete the buffer without losing layout",},
    },
    config = function()
      vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', {silent = true}, {desc = "Delete buffer without losing layout"}) 
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    lazy = true,
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
      --vim.keymap.set('n', '<leader>')
    end,
  },

  --under testing, possibly may replace with https://github.com/ethanholz/nvim-lastplace?tab=readme-ov-file
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },

  {
    "wakatime/vim-wakatime",
    lazy = true,
    event = "BufWinEnter",
  },

  -- install this plugin (https://github.com/willothy/wezterm.nvim) when trying wezterm
  -- {
  --   'willothy/wezterm.nvim',
  --   config = true
  -- },
  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    lazy = true,
    config = function()
      require("plugin.illuminate")
    end,
  },

  -- {
  --   "TobinPalmer/Tip.nvim",
  --   event = "VimEnter",
  --   init = function()
  --     -- Default config
  --     --- @type Tip.config
  --     require("tip").setup({
  --       seconds = 3,
  --       title = "Tip!",
  --       url = "https://vtip.43z.one",
  --     })
  --   end,
  -- },

  {
    "williamboman/mason.nvim",
    config = function()
      require("plugin.mason")
    end,
    cmd = "Mason",
    event = "BufReadPre",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      'windwp/nvim-autopairs',
    },
    config = function()
      require("plugin.lsp")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("plugin.masonlsp")
    end,
  },

  -- {
  --   'hrsh7th/cmp-nvim-lsp'
  -- },
  -- 
  -- {
  --   'hrsh7th/cmp-buffer'
  -- },
  --
  -- {
  --   'hrsh7th/cmp-path'
  -- },
  --
  -- {
  --   'hrsh7th/cmp-cmdline'
  -- },

  {
    "folke/neodev.nvim",
    lazy = true,
    event = "BufReadPre",
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    lazy = true,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "petertriho/cmp-git", -- TODO:https://github.com/petertriho/cmp-git for config
      'hrsh7th/cmp-buffer', -- NOTE:https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-emoji',
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("plugin.cmp")
    end,
  },

}
