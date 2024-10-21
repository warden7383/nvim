return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugin.treesitter")
		end,
		-- Initial: lazy false, no lazy event
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", desc = "Find Files" },
			{ "<leader>fg", desc = "Live Grep" },
			{ "<leader>fb", desc = "Find Buffers" },
			{ "<leader>fh", desc = "Find Help" },
			{ "<leader>fo", desc = "Find Old Files" },
			{ "<leader>fc", desc = "Find Highlights" },
			{ "<leader>fk", desc = "Find Keymaps" },
			{ "<leader>sb", desc = "Search current buffer" },
		},
		config = function()
			require("plugin.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter", --from docs, the known methods to lazyload this is BufReadPre BufNewFile
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		lazy = true,
	},

	{
		"windwp/nvim-autopairs",
		-- NOTE: a dependency for nvim-cmp when nvimlsp is loaded
		--
		event = { "BufReadPre", "BufAdd" },
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
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			vim.g.skip_ts_context_commentstring_module = true
		end,
		lazy = true,
		-- Set vim.g.skip_ts_context_commentstring_module = true somewhere in your
		-- configuration to skip backwards compatibility routines and speed up loading.
	},

	{
		"folke/trouble.nvim",
		lazy = true,
		-- opts = {}, -- for default options, refer to the configuration section for custom setup.
		opts = require("plugin.trouble"),
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xb",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xp",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufAdd" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("plugin.todoComments")
		end,
		lazy = true,
	},

	{
		"andymass/vim-matchup",
		event = { "BufReadPre", "BufAdd" },
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
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
		event = { "BufReadPre", "BufAdd" },
		lazy = true,
		config = function()
			require("plugin.illuminate")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
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
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				-- NOTE: More information on how to configure this plugin can be found in
				-- :h nvim-surround.configuration.
			})
		end,
	},

	{
		"folke/flash.nvim",
		-- event = {"BufReadPre", "BufAdd"},
		keys = {
			{ "<leader>jp", desc = "Flash jump on search word" },
			{ "<leader>jc", desc = "Flash jump word on cursor" },
			{ "<leader>jj", desc = "Flash jump" },
			{ "<leader>jt", desc = "Flash jump treesitter" },
			{ "F" },
			{ "f" },
		},
		config = function()
			require("plugin.flash")
		end,
	},

	{
		"monaqa/dial.nvim",
		lazy = true,
		keys = {
			{ "<C-a>", desc = "increment in normal" },
			{ "<C-x>", desc = "decretment in normal" },
			{ "g<C-a>", desc = "increment in gnormal" },
			{ "g<C-x>", desc = "decrement in gnormal" },
			{ "<C-a>", desc = "increment in visual", mode = "v" },
			{ "<C-x>", desc = "increment in visual", mode = "v" },
			{ "g<C-a>", desc = "increment in gvisual", mode = "v" },
			{ "g<C-x>", desc = "decrement in gvisual", mode = "v" },
		},
		config = function()
			require("plugin.dial")
		end,
	},

	-- {
	-- 	"nvim-pack/nvim-spectre",
	-- 	lazy = true,
	-- 	-- event = {"BufReadPre", "BufAdd"},
	-- 	cmds = { "Spectre" },
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("plugin.spectre")
	-- 	end,
	-- },

	{
		"smjonas/inc-rename.nvim",
		lazy = true,
		-- event = {"BufReadPre", "BufAdd"},
		keys = {
			{ "<leader>wr" },
			{ "<leader>we" },
		},
		config = function()
			require("inc_rename").setup()
			vim.keymap.set("n", "<leader>wr", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
			vim.keymap.set("n", "<leader>we", ":IncRename ")
		end,
	},

	-- {
	-- 	"AckslD/muren.nvim",
	-- 	lazy = true,
	-- 	cmds = { "MurenToggle" },
	-- 	keys = {
	-- 		{ "<leader>mt" },
	-- 	},
	-- 	config = function()
	-- 		require("plugin.muren")
	-- 	end,
	-- },

	{
		"kungfusheep/randomword.nvim",
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.randomword")
		end,
	},

	{
		"otavioschwanck/arrow.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.arrow")
		end,
		-- opts = {
		--   show_icons = true,
		--   leader_key = ';', -- Recommended to be a single key
		--   buffer_leader_key = 'm', -- Per Buffer Mappings
		-- }
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		-- ft = {"md", "markdown", "txt" },
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.render-markdown")
		end,
		opt = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}, -- if you prefer nvim-web-devicons
	},
}
