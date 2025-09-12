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
		lazy = true,
	},

	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
		lazy = true,
	},

	-- {
	-- 	"famiu/bufdelete.nvim",
	-- 	lazy = true,
	-- 	keys = {
	-- 		{ "<leader>q", ":Bdelete<CR>", desc = "Delete the buffer without losing layout" },
	-- 	},
	-- 	config = function()
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<leader>q",
	-- 			":Bdelete<CR>",
	-- 			{ silent = true },
	-- 			{ desc = "Delete buffer without losing layout" }
	-- 		)
	-- 	end,
	-- },

	{
		"NvChad/nvim-colorizer.lua",
		lazy = true,
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"farmergreg/vim-lastplace",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
	},

	{
		"wakatime/vim-wakatime",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
	},

	-- install this plugin (https://github.com/willothy/wezterm.nvim) when trying wezterm
	-- {
	--   'willothy/wezterm.nvim',
	--   config = true
	-- },

	-- {
	-- 	"goolord/alpha-nvim",
	-- 	lazy = true,
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("plugin.alpha")
	-- 	end,
	-- },

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.toggleterm")
		end,
	},

	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
		end,
		lazy = true,
		-- event = "CmdlineEnter",
		cmd = { "IconPickerYank", "IconPickerInsert", "IconPickerNormal" },
		dependencies = {
			"stevearc/dressing.nvim",
		},
	},

	{
		"rmagatti/auto-session",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		-- cmd = { "Autosession", "SessionRestore" },
		cmd = { "SessionSearch", "SessionRestore", "Autosession" },
		config = function()
			require("plugin.auto-session")
		end,
		-- dependencies = {
		-- 	"stevearc/dressing.nvim",
		-- },
	},

	{
		"folke/which-key.nvim",
		event = { "BufReadPre", "BufAdd" },
		lazy = true,
		-- keys = {
		-- 	{ "<leader>" },
		-- },
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function()
			require("plugin.which-key")
		end,
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<leader>fd", desc = "Telescope file browser" },
			{ "<leader>d", desc = "Telescope file browser on current buffer path" },
		},
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
		cmd = { "Z", "Zi", "Lz", "Tz", "Lzi", "Tzi" },
	},

	{
		"stevearc/oil.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd", "CmdlineEnter" },
		-- event = "VeryLazy",
		-- opts = {},
		keys = {
			{ "<leader>of", desc = "Open Oil as Floating window" },
			{ "<leader>ob", desc = "Open Oil as Buffer" },
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.oil")
		end,
	},

	{
		"stevearc/conform.nvim",
		-- opts = {},
		-- event = {"BufReadPre", "BufAdd"},
		event = { "BufWritePre" }, -- Recommended by conform docs
		cmd = { "ConformInfo" },
		config = function()
			require("plugin.conform")
		end,
		lazy = true,
	},

	--   TODO: Configure this ai tool(requires api keys)
	--
	--   https://github.com/yetone/avante.nvim?tab=readme-ov-file
	-- {
	--   "yetone/avante.nvim",
	--   event = "VeryLazy",
	--   lazy = false,
	--   version = false, -- set this if you want to always pull the latest change
	--   opts = {
	--     -- add any opts here
	--   },
	--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	--   build = "make",
	--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	--   dependencies = {
	--     "stevearc/dressing.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "MunifTanjim/nui.nvim",
	--     --- The below dependencies are optional,
	--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	--     "zbirenbaum/copilot.lua", -- for providers='copilot'
	--     {
	--       -- support for image pasting
	--       "HakonHarnes/img-clip.nvim",
	--       event = "VeryLazy",
	--       opts = {
	--         -- recommended settings
	--         default = {
	--           embed_image_as_base64 = false,
	--           prompt_for_file_name = false,
	--           drag_and_drop = {
	--             insert_mode = true,
	--           },
	--           -- required for Windows users
	--           use_absolute_path = true,
	--         },
	--       },
	--     },
	--     {
	--       -- Make sure to set this up properly if you have lazy=true
	--       'MeanderingProgrammer/render-markdown.nvim',
	--       opts = {
	--         file_types = { "markdown", "Avante" },
	--       },
	--       ft = { "markdown", "Avante" },
	--     },
	--   },
	-- }

	-- {
	-- 	"Shatur/neovim-session-manager",
	-- 	lazy = true,
	-- 	event = { "BufReadPre", "BufAdd" },
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"stevearc/dressing.nvim",
	-- 	},
	-- 	cmd = { "SessionManager" },
	-- 	config = function()
	-- 		require("plugin.neovim-session-manager")
	-- 	end,
	-- },

	-- {
	-- 	"stevearc/resession.nvim",
	-- 	-- opts = {},
	-- 	lazy = true,
	-- 	-- event = { "BufReadPre", "BufAdd", "CmdlineEnter" },
	-- 	event = "VeryLazy",
	-- 	cmd = { "ResessionSave", "ResessionLoad", "ResessionDelete" },
	-- 	config = function()
	-- 		require("plugin.resession")
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"otavioschwanck/arrow.nvim",
	-- 		"akinsho/bufferline.nvim",
	-- 		"stevearc/dressing.nvim",
	-- 		"lewis6991/gitsigns.nvim",
	-- 		"b0o/incline.nvim",
	-- 		"lukas-reineke/indent-blankline.nvim",
	-- 		"nvim-lualine/lualine.nvim",
	-- 		"dstein64/nvim-scrollview",
	-- 		"kylechui/nvim-surround",
	-- 		"nvim-treesitter/nvim-treesitter-textobjects",
	-- 		"windwp/nvim-ts-autotag",
	-- 		"JoosepAlviste/nvim-ts-context-commentstring",
	-- 		"kungfusheep/randomword.nvim",
	-- 		"MeanderingProgrammer/render-markdown.nvim",
	-- 		"mrjones2014/smart-splits.nvim",
	-- 		"nvim-telescope/telescope-file-browser.nvim",
	-- 		"folke/todo-comments.nvim",
	-- 		"akinsho/toggleterm.nvim",
	-- 		"tpope/vim-fugitive",
	-- 		"RRethy/vim-illuminate",
	-- 		"farmergreg/vim-lastplace",
	-- 		"andymass/vim-matchup",
	-- 		"wakatime/vim-wakatime",
	-- 		"folke/which-key.nvim",
	-- 	},
	-- },
	{
		"kawre/leetcode.nvim",
		lazy = true,
		cmd = "Leet",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
		},
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- bigfile = { enabled = true },
			-- dashboard = { enabled = true },  -- TODO: after shower: modualize these plugins into multiple files
			-- explorer = { enabled = true },
			-- indent = { enabled = true },
			-- input = { enabled = true },
			-- picker = { enabled = true },
			-- notifier = { enabled = true },
			-- quickfile = { enabled = true },
			-- scope = { enabled = true },
			-- scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			-- words = { enabled = true },
			animate = require("plugin.snacksPlugins.animate"),
			bigfile = require("plugin.snacksPlugins.bigfile"),
			bufdelete = require("plugin.snacksPlugins.bufdelete"),
			dashboard = require("plugin.snacksPlugins.dashboard"),
			debug = { enabled = false },
			dim = { enabled = false },
			explorer = require("plugin.snacksPlugins.explorer"),
			gitbrowse = require("plugin.snacksPlugins.gitbrowse"),
			image = {}, -- running defaults, no file currently
			indent = require("plugin.snacksPlugins.indent"),
			-- input = require("plugin.snacksPlugins.input"),
			picker = require("plugin.snacksPlugins.picker"),
			-- notifier = require("plugin.snacksPlugins.notifier"),
			-- quickfile = require("plugin.snacksPlugins.quickfile"),
			-- scope = require("plugin.snacksPlugins.scope"),
			-- scroll = require("plugin.snacksPlugins.scroll"),
			-- statuscolumn = require("plugin.snacksPlugins.statuscolumn"),
			-- words = require("plugin.snacksPlugins.words"),
			styles = require("plugin.snacksPlugins.stylesConfig"),
		},
		keys = {
			{
				"<Leader>q",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete buffer without losing layout",
			},
		},
	},
}
