return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugin.webdevicons")
    end,
    lazy = true,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },

  {
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood",
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
    end,
  },

  --under testing, possibly may replace with https://github.com/ethanholz/nvim-lastplace?tab=readme-ov-file
  -- TESTING: attempting to lazyload
  {
    "farmergreg/vim-lastplace",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
  },

  {
    "wakatime/vim-wakatime",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
  },

  -- install this plugin (https://github.com/willothy/wezterm.nvim) when trying wezterm
  -- {
  --   'willothy/wezterm.nvim',
  --   config = true
  -- },

  {
    'goolord/alpha-nvim',
    lazy = true,
    event = "VimEnter",
    config = function ()
      require("plugin.alpha")
    end
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.toggleterm")
    end,
  },

  { 
    "ziontee113/icon-picker.nvim" ,
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
    lazy = true,
    event = "CmdlineEnter",
    dependencies = {
      'stevearc/dressing.nvim',
    }
  },

  -- {
  --   "olimorris/persisted.nvim",
  --   lazy = true,
  --   cmd = { "SessionLoadLast"  },
  --   event = "VeryLazy",
  --   config = function()
  --     require("plugin.persisted")
  --   end,
  --   dependencies = {
  --     "nvim-tree/nvim-tree.lua",
  --   }
  -- },

  {
    'rmagatti/auto-session',
    lazy = true,
    event = {"BufReadPre", "BufAdd", "VeryLazy"},
    cmd = {"Autosession", "SessionRestore"},
    config = function()
      require("plugin.auto-session")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- init = function()
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 1000
    -- end,
    -- opts = {
    --   -- your configuration comes here
    --   -- or leave it empty to use the default settings
    --   -- refer to the configuration section below
    -- }
    config = function ()
      require("plugin.which-key")
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    lazy = true,

  },

  {
    "NStefan002/2048.nvim",
    cmd = "Play2048",
    config = true,
    lazy = true,
  },

  {
    "nanotee/zoxide.vim",
    lazy = true,
    cmd = {"Z", "Zi", "Lz", "Tz", "Lzi", "Tzi"},
  },

  {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("plugin.oil")
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {},
    event = {"BufReadPre", "BufAdd"},
    config = function ()
      require("plugin.conform")
    end,
  },
}
