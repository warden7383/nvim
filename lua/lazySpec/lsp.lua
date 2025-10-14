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
			"saghen/blink.cmp",
			-- 'nvimdev/lspsaga.nvim',
		},
		config = function()
			require("plugin.lsp") -- for blinkCmp.nvim
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

	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		--  "ray-x/lsp_signature.nvim",
	-- 		"onsails/lspkind.nvim",
	-- 		"L3MON4D3/LuaSnip",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"petertriho/cmp-git", -- TODO:https://github.com/petertriho/cmp-git for config
	-- 		"hrsh7th/cmp-buffer", -- NOTE:https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file
	-- 		-- 'hrsh7th/cmp-path',
	-- 		"hrsh7th/cmp-cmdline",
	-- 		"FelipeLema/cmp-async-path",
	-- 		"hrsh7th/cmp-calc",
	-- 		"roobert/tailwindcss-colorizer-cmp.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp-signature-help",
	-- 		"windwp/nvim-autopairs",
	-- 	},
	-- 	lazy = true,
	-- 	event = { "InsertEnter", "CmdLineEnter", "VeryLazy" },
	-- 	config = function()
	-- 		require("plugin.cmp")
	-- 	end,
	-- },

	{
		"saghen/blink.cmp",
		lazy = true,
		event = { "InsertEnter", "CmdLineEnter", "VeryLazy" },
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		----@module 'blink.cmp'
		----@type blink.cmp.Config
		-- opts = require("blinkCmp").config(),
		opts = require("plugin.blinkCmp"),
		-- opts = {
		-- 	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
		-- 	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
		-- 	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- 	--
		-- 	-- All presets have the following mappings:
		-- 	-- C-space: Open menu or open docs if already open
		-- 	-- C-e: Hide menu
		-- 	-- C-k: Toggle signature help
		-- 	--
		-- 	-- See the full "keymap" documentation for information on defining your own keymap.
		-- 	keymap = { preset = "default" },
		--
		-- 	appearance = {
		-- 		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- 		-- Useful for when your theme doesn't support blink.cmp
		-- 		-- Will be removed in a future release
		-- 		use_nvim_cmp_as_default = true,
		-- 		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- 		-- Adjusts spacing to ensure icons are aligned
		-- 		nerd_font_variant = "mono",
		-- 	},
		--
		-- 	-- Default list of enabled providers defined so that you can extend it
		-- 	-- elsewhere in your config, without redefining it, due to `opts_extend`
		-- 	sources = {
		-- 		default = { "lsp", "path", "snippets", "buffer" },
		-- 	},
		--
		-- 	-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
		-- 	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- 	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		-- 	--
		-- 	-- See the fuzzy documentation for more information
		-- 	fuzzy = { implementation = "prefer_rust_with_warning" },
		-- },
		opts_extend = { "sources.default" },
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
