local config = {
	enabled = true,
	timeout = 5000,
	icons = {
		debug = "",
		error = "",
		info = "",
		trace = "✎",
		warn = "",
	},
	margin = { top = 0, right = 2, bottom = 0 },
	level = vim.log.levels.TRACE,
	style = "compact",
}

return config
