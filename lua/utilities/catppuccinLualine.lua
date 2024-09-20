-- #macchiato colorscheme

local colors = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	subtext1 = "#b8c0e0",
	subtext0 = "#a5adcb",
	overlay2 = "#939ab7",
	overlay1 = "#8087a2",
	overlay0 = "#6e738d",
	surface2 = "#5b6078",
	surface1 = "#494d64",
	surface0 = "#363a4f",
	base = "#24273a",
	mantle = "#1e2030",
	crust = "#24283b",
	-- The colors below are not part of catppuccin's palette
	transparent_bg = "NONE", -- #1e2030
	black = "#16161e",
	text1 = "#a9b1d6",
}

-- return {
-- 	normal = {
-- 		a = { bg = colors.blue, fg = colors.mantle, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.blue },
-- 		c = { bg = colors.black, fg = colors.text },
-- 	},
--
-- 	insert = {
-- 		a = { bg = colors.green, fg = colors.base, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.green },
-- 	},
--
-- 	terminal = {
-- 		a = { bg = colors.green, fg = colors.base, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.green },
-- 	},
--
-- 	command = {
-- 		a = { bg = colors.peach, fg = colors.base, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.peach },
-- 	},
--
-- 	visual = {
-- 		a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.mauve },
-- 	},
--
-- 	replace = {
-- 		a = { bg = colors.red, fg = colors.base, gui = "bold" },
-- 		b = { bg = colors.surface0, fg = colors.red },
-- 	},
--
-- 	inactive = {
-- 		a = { bg = colors.transparent_bg, fg = colors.blue },
-- 		b = { bg = colors.transparent_bg, fg = colors.surface1, gui = "bold" },
-- 		c = { bg = colors.transparent_bg, fg = colors.overlay0 },
-- 	},
-- }

return {
	normal = {
		a = { bg = colors.black, fg = colors.blue, gui = "bold" },
		b = { bg = colors.black, fg = colors.blue },
		c = { bg = colors.black, fg = colors.text },
	},

	insert = {
		a = { bg = colors.black, fg = colors.green, gui = "bold" },
		b = { bg = colors.black, fg = colors.green },
	},

	terminal = {
		a = { bg = colors.black, fg = colors.green, gui = "bold" },
		b = { bg = colors.black, fg = colors.green },
	},

	command = {
		a = { bg = colors.black, fg = colors.peach, gui = "bold" },
		b = { bg = colors.black, fg = colors.peach },
	},

	visual = {
		a = { bg = colors.black, fg = colors.mauve, gui = "bold" },
		b = { bg = colors.black, fg = colors.mauve },
	},

	replace = {
		a = { bg = colors.black, fg = colors.red, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
	},

	inactive = {
		a = { bg = colors.transparent_bg, fg = colors.blue },
		b = { bg = colors.transparent_bg, fg = colors.surface1, gui = "bold" },
		c = { bg = colors.transparent_bg, fg = colors.overlay0 },
	},
}
