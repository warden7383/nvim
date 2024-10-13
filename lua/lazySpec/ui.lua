return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufAdd" },
		main = "ibl",
		-- opts = {},
		config = function()
			require("plugin.indent-blankline")
		end,
		lazy = true,
	},

	{
		"dstein64/nvim-scrollview",
		event = { "BufReadPre", "BufAdd" },
		config = function()
			-- require("scrollview").setup({})
			require("plugin.scrollview")
		end,
		lazy = true,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.bufferline")
		end,
	},

	{
		"b0o/incline.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.incline")
		end,
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		-- opts = {},
		config = function()
			require("plugin.dressing")
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
		-- opts = {
		--   -- add any options here
		-- },
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	-- {
	--   'Bekaboo/dropbar.nvim',
	--   -- optional, but required for fuzzy finder support
	--   lazy = true,
	--   event = {"BufReadPre", "BufAdd"},
	--   config = function()
	--     require("plugin.dropbar")
	--   end,
	--   dependencies = {
	--     'nvim-telescope/telescope-fzf-native.nvim'
	--   }
	-- },

	-- NOTE: can be integrated with several terminal emulators such as wezterm for win
	{
		"mrjones2014/smart-splits.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.smart-splits")
		end,
		dependencies = {
			-- "kwkarlwang/bufresize.nvim",
		},
	},

	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("plugin.colorful-winsep")
		end,
		event = { "WinNew" },
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach` WARN: lsp attach event does not properly
		-- load this plugin properly on certain filetypes such as .cpp
		config = function()
			-- require("tiny-inline-diagnostic").setup()
			require("plugin.tiny-inline-diagnostic")
		end,
	},
}
