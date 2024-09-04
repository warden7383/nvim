-- local data = vim.fn.stdpath("data") .. "/mason/bin/stylua"
-- print(data)

-- stylua ready (lua) C:\Users\Andrew Ng\AppData\Local\nvim-data\mason\bin\stylua.CMD
require("conform").setup({
	log_level = vim.log.levels.DEBUG,
	formatters_by_ft = {
		lua = {
			"stylua",
		},
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		cpp = {
			"clang_format",
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = false,
	},
	notify_on_error = true,
	notify_no_formatters = true,

	formatters = {
		stylua = {
			-- NOTE: explosing the formatter to the .exe while adding the formatter to the system
			-- PATH seems to help instead of just exposing conform to the "stylua" command
			command = "stylua.exe",

			-- command = "C:\\Users\\'Andrew Ng'\\AppData\\Local\\nvim-data\\mason\\packages\\stylua\\stylua.exe",
			-- WARN: spaces in directorys must be escaped with quotes
			-- command = 'C:/Users/\'Andrew Ng\'/AppData/Local/nvim-data/mason/packages/stylua/stylua.exe',
		},
		clang_format = {
			command = "clang-format",
			args = {
				"-style=file",
			},
		},
	},
})
