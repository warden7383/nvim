return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		config = function()
			require("plugin.gitsigns")
		end,
	},

	-- {
	--   "kdheepak/lazygit.nvim",
	--   -- optional for floating window border decoration
	--   lazy = true,
	--   -- event = {"BufReadPre", "BufAdd"},
	--   cmd = {"LazyGit", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
	--   config = function ()
	--     require("plugin.lazygit")
	--   end,
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--   },
	-- },

	{
		"tpope/vim-fugitive",
		lazy = true,
		event = { "BufReadPre", "BufAdd" },
		-- TODO: read docs
	},
}
