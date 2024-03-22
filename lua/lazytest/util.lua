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

}
