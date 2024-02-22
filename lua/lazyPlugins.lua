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
    event = {"BufReadPre", "BufAdd"},
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
    event = { "BufReadPre", "CmdlineEnter", "BufAdd" }, -- Initial: BufEnter
    cmd = {"NvimTree"},
    keys = { "<leader>d", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle NvimTree (FileTree)"},
    config = function()
      require("plugin.nvimtree")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true, -- Initial: false
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

  {
    'ThePrimeagen/vim-be-good',
    cmd = "VimBeGood",
    lazy = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
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
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufAdd"},
    main = "ibl",
    opts = {},
    config = function()
      require("plugin.indent-blankline")
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
    "dstein64/nvim-scrollview",
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("scrollview").setup{

      }
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
    "RRethy/vim-illuminate",
    event = {"BufReadPre", "BufAdd"},
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
    event = {"BufReadPre", "BufAdd"},
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
    event = {"BufReadPre", "BufAdd", "CmdLineEnter"},
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
    event = {"BufReadPre", "BufAdd"},
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
    --  "ray-x/lsp_signature.nvim",
      "onsails/lspkind.nvim",
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "petertriho/cmp-git", -- TODO:https://github.com/petertriho/cmp-git for config
      'hrsh7th/cmp-buffer', -- NOTE:https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file
     -- 'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      "roobert/tailwindcss-colorizer-cmp.nvim", 
      "hrsh7th/cmp-nvim-lsp-signature-help",
      'windwp/nvim-autopairs',
    },
    lazy = true,
    event = { "InsertEnter", "CmdLineEnter" },
    config = function()
      require("plugin.cmp")
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.bufferline")
    end,
  },

  {
    "b0o/incline.nvim",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.incline")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
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
    event = {"BufReadPre", "BufAdd"},
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
    lazy = true,
    event = "VimEnter",
    config = function ()
      require("plugin.alpha")
    end
  },

  -- NOTE: required for icon-picker.nvim
  {
    'stevearc/dressing.nvim',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    opts = {},
    config = function()
      require("plugin.dressing")
    end,
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
    config = function()
      require("plugin.notify")
    end,
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
    event = "VeryLazy",
    config = function()
      require("plugin.persisted")
    end,
    dependencies = {
      "nvim-tree/nvim-tree.lua",
    }
  },

  {
    "folke/flash.nvim",
    event = {"BufReadPre", "BufAdd"},
    ---@type Flash.Config
    -- opts = {},
    -- stylua:
    config = function()
      require("plugin.flash")
    end,
    keys = {
      -- { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.dropbar")
    end,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },

  -- NOTE: prevents autostart from happening? (source: lua_ls lsps)
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   lazy = true,
    -- opts = {},
    -- dependencies = {
    --   "neovim/nvim-lspconfig",
    -- },
    -- event = "VeryLazy",
    -- config = function()
    --   require("plugin.lsp_signature")
    -- end,
  -- },

  -- {
  --   'huy-hng/anyline.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require("plugin.anyline")
  --   end,
  --   event = 'VeryLazy',
  --   lazy = true,
  -- },
  { 
    "monaqa/dial.nvim",
    lazy = true,
    keys = {
      {"<C-a>", desc = "increment in normal" },
      {"<C-x>", desc = "decretment in normal" },
      {"g<C-a>", desc = "increment in gnormal" },
      {"g<C-x>", desc = "decrement in gnormal" },
      {"<C-a>", desc = "increment in visual", mode = "v" },
      {"<C-x>", desc = "increment in visual", mode = "v"},
      {"g<C-a>", desc = "increment in gvisual", mode = "v"},
      {"g<C-x>", desc = "decrement in gvisual", mode = "v"},
    },
    config = function()
      require("plugin.dial")
    end,
  },

-- NOTE: can be integrated with several terminal emulators such as wezterm for win
  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function ()
      require("plugin.smart-splits")
    end,
    dependencies = {
      "kwkarlwang/bufresize.nvim",
    },
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require('plugin.colorful-winsep')
    end,
    event = { "WinNew" },
  },

  { 
    "kwkarlwang/bufresize.nvim",
   lazy = true,
   config = function()
     require("plugin.bufresize")
   end,
  },
  
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.gitsigns")
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
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function ()
      require("plugin.lazygit")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "tpope/vim-fugitive",
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    -- TODO: read docs
  },

  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    -- event = {"BufReadPre", "BufAdd"},
    cmds = {"Spectre"},
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("plugin.spectre")
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    -- event = {"BufReadPre", "BufAdd"},
    keys = {
      {"<leader>wr"},
      {"<leader>we"},
    },
    config = function()
      require("inc_rename").setup()
      vim.keymap.set("n", "<leader>wr", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
      vim.keymap.set("n", "<leader>we", ":IncRename ")
    end,
  },

  {
    'AckslD/muren.nvim',
    lazy = true,
    cmds = { "MurenToggle"},
    keys = {
      {"<leader>mt"},
    },
    config = function()
      require("plugin.muren")
    end,
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
}
