require("tokyonight").setup({
	transparent = true,
	terminal_colors = true,
	styles = {
		floats = "transparent",
		sidebars = "transparent",
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	}, -- testing
	lualine_bold = true,
	--  lualine_bold = true, -- enable when lualine is installed
	-- on_highlights = function(hl, c)
	--        local commentColor = "777c96"
	--        hl.Comment = {
	--            fg = commentColor,
	--       }
	--   end,
	-- sidebars = { "qf", "help", "terminal", "NvimTree"}
})
