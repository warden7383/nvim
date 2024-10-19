return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugin.mason")
		end,
		cmd = "Mason",
		event = { "BufReadPre", "BufAdd", "VeryLazy" },
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
		event = { "BufReadPre", "BufAdd", "CmdLineEnter", "VeryLazy" },
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

	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		lazy = true,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			--  "ray-x/lsp_signature.nvim",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"petertriho/cmp-git", -- TODO:https://github.com/petertriho/cmp-git for config
			"hrsh7th/cmp-buffer", -- NOTE:https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file
			-- 'hrsh7th/cmp-path',
			"hrsh7th/cmp-cmdline",
			"FelipeLema/cmp-async-path",
			"hrsh7th/cmp-calc",
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"windwp/nvim-autopairs",
		},
		lazy = true,
		event = { "InsertEnter", "CmdLineEnter", "VeryLazy" },
		config = function()
			require("plugin.cmp")
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = true, -- This plugin is already lazy
		event = "VeryLazy",
		config = function()
			require("plugin.rustaceanvim")
		end,
	},
}
