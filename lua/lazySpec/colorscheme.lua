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
}
