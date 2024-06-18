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
    keys = {
      {"<leader>ff", desc = "Find Files"},
      {"<leader>fg", desc = "Live Grep"},
      {"<leader>fb", desc = "Find Buffers"},
      {"<leader>fh", desc = "Find Help"},
      {"<leader>fo", desc = "Find Old Files"},
      {"<leader>fc", desc = "Find Highlights"},
      {"<leader>fk", desc = "Find Keymaps"},
      {"<leader>sb", desc = "Search current buffer"},
    },
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

  -- { -- testing the builtin (mini.comment) that was implemented into v0.10
  --   'numToStr/Comment.nvim',
  --   event = {"BufReadPre", "BufAdd"},
  --   config = function()
  --     require('Comment').setup()
  --   end,
  --   lazy = true,
  -- },

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

  -- {
  --   "karb94/neoscroll.nvim",
  --   -- event = {"BufReadPre", "BufAdd"},
  --   keys = { 
  --     { "<C-d>", desc = "Neoscroll down" },
  --     { "<C-u>", desc = "Neoscroll up" },
  --   },
  --   config = function ()
  --     require("plugin.neoscroll")
  --   end,
  --   lazy = true,
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
    "folke/flash.nvim",
    -- event = {"BufReadPre", "BufAdd"},
    keys = {
      {"<leader>jp", desc = "Flash jump on search word"},
      {"<leader>jc", desc = "Flash jump word on cursor"},
      {"<leader>jj", desc = "Flash jump"},
      {"<leader>jt", desc = "Flash jump treesitter"},
      {"F"},
      {"f"},
    },
    config = function()
      require("plugin.flash")
    end,
  },

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
    "kungfusheep/randomword.nvim",
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.randomword")
    end,
  }
}
