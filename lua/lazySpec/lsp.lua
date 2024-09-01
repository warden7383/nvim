return {
  -- {
  --   'nvimdev/lspsaga.nvim',
  --   lazy = true,
  --   config = function()
  --     require("plugin.lspsaga")
  --   end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter', -- optional
  --     'nvim-tree/nvim-web-devicons'     -- optional
  --   },
  -- },

  {
    "williamboman/mason.nvim",
    config = function()
      require("plugin.mason")
    end,
    cmd = "Mason",
    event = {"BufReadPre", "BufAdd", "VeryLazy"},
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason.nvim",
      -- 'nvimdev/lspsaga.nvim',
    },
    config = function()
      -- require("plugin.lsp") -- NOTE: this was being called on last line of cmp.lua as well.
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = {"BufReadPre", "BufAdd", "CmdLineEnter", "VeryLazy"},
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("plugin.masonlsp")
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        -- { path = "luvit-meta/library", words = { "vim%.uv" } }, -- NOTE: enable when luvit-meta is instal;led
      },
    },
  },
  -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  -- { -- optional completion source for require statements and module annotations
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, {
  --       name = "lazydev",
  --       group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --     })
  --   end,
  -- },

  -- NOTE: archieved, use lazydev.nvim instead
  -- {
  --   "folke/neodev.nvim",
  --   lazy = true,
  --   event = {"BufReadPre", "BufAdd"},
  -- },

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
      'hrsh7th/cmp-calc',
      "roobert/tailwindcss-colorizer-cmp.nvim", 
      "hrsh7th/cmp-nvim-lsp-signature-help",
      'windwp/nvim-autopairs',
    },
    lazy = true,
    event = { "InsertEnter", "CmdLineEnter", "VeryLazy" },
    config = function()
      require("plugin.cmp")
    end,
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
}
