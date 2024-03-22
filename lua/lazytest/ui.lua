return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("plugin.lualine")
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
    "dstein64/nvim-scrollview",
    event = {"BufReadPre", "BufAdd"},
    config = function()
      require("scrollview").setup{

      }
    end,
    lazy = true,
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

}
