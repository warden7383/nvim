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
    -- Initial: lazy false, no lazy event
    lazy = true, 
    event = "BufReadPre",
  },

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
    "nvim-tree/nvim-tree.lua",
    event = { "BufReadPre", "CmdlineEnter" }, -- Initial: BufEnter
    cmd = {"NvimTree"},
    keys = { "<leader>d", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle NvimTree (FileTree)"},
    config = function()
      require("plugin.nvimtree")
      print("loaded nvimtree")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true, -- Initial: false
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    lazy = true,
    event = "BufReadPre",
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

  {
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood",
    lazy = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = "BufReadPre",
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
    event = "BufReadPre",
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
    event = "BufReadPre",
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
    event = "BufReadPre",
    main = "ibl",
    opts = {},
    config = function()
      require("plugin.indent-blankline")
    end,
    lazy = true,
  },

  {
    "andymass/vim-matchup",
    event = "BufReadPre",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup"}
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    config = function ()
      require('neoscroll').setup {}
    end,
    lazy = true,
  },

  {
    "dstein64/nvim-scrollview",
    event = "BufReadPre",
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
    end,
  },

  --under testing, possibly may replace with https://github.com/ethanholz/nvim-lastplace?tab=readme-ov-file
  -- TESTING: attempting to lazyload
  {
    "farmergreg/vim-lastplace",
    lazy = true,
    event = "BufReadPre",
  },

  {
    "wakatime/vim-wakatime",
    lazy = true,
    event = "BufReadPre",
  },

  -- install this plugin (https://github.com/willothy/wezterm.nvim) when trying wezterm
  -- {
  --   'willothy/wezterm.nvim',
  --   config = true
  -- },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPre",
    lazy = true,
    config = function()
      require("plugin.illuminate")
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    config = function()
      require("plugin.lspsaga")
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    },
  },

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
    lazy = true,
    dependencies = {
      "williamboman/mason.nvim",
      'nvimdev/lspsaga.nvim',
    },
    config = function()
      -- require("plugin.lsp") -- NOTE: this was being called on last line of cmp.lua as well.
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
      "onsails/lspkind.nvim",
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "petertriho/cmp-git", -- TODO:https://github.com/petertriho/cmp-git for config
      'hrsh7th/cmp-buffer', -- NOTE:https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      'windwp/nvim-autopairs',
    },
    lazy = true,
    event = { "BufReadPre", "CmdLineEnter" },
    config = function()
      require("plugin.cmp")
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("plugin.bufferline")
    end,
  },

  {
    "b0o/incline.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("plugin.incline")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugin.treesitterObjects")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
        -- NOTE: More information on how to configure this plugin can be found in 
        -- :h nvim-surround.configuration.
      })
    end
  },

  {
    'goolord/alpha-nvim',
    config = function ()
      require("plugin.alpha")
    end
  },

  -- NOTE: required for icon-picker.nvim
  {
    'stevearc/dressing.nvim',
    lazy = true,
    event = "BufReadPre",
    opts = {},
    config = function()
      require("plugin.dressing")
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("plugin.toggleterm")
    end,
  },
  -- NOTE: will create 2 statuscolumn icons when todo.nvim is at used
  -- {
  --   "luukvbaal/statuscol.nvim",
  --   lazy = true,
  --   event = "BufReadPre",
  --   config = function()
  --     require("plugin.statuscol")
  --   end,
  -- },

  { 
    "ziontee113/icon-picker.nvim" ,
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader>i", "<cmd>IconPickerNormal<cr>", opts)
      vim.keymap.set("n", "<Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
      vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
    end,
    lazy = true,
    event = "CmdlineEnter",
    dependencies = {
      'stevearc/dressing.nvim',
    }
  },

  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy", --default: VeryLazy
    config = function()
      require("plugin.noice")
    end,
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "olimorris/persisted.nvim",
    lazy = true,
    cmd = { "SessionLoadLast"  },
    config = function()
      require("plugin.persisted")
    end,
  },

}

