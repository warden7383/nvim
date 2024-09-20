local catppuccin = require("utilities.catppuccinLualine")

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

local function lspStatus()
	local lspName = vim.lsp.get_clients({ bufnr = 0 })
	local name = ""
	local icon = " "

	if lspName[1] == nil then
		name = icon .. "No Active LSP"
	else
		name = icon .. lspName[1].name
	end

	return name
end

local function wordStats()
	local mode = vim.api.nvim_get_mode().mode

	if mode == "v" or mode == "vs" or mode == "V" or mode == "Vs" or mode == "\22" or mode == "\22s" then
		return vim.fn.wordcount().visual_words .. " words " .. vim.fn.wordcount().visual_chars .. " chars"
	else
		local words = vim.fn.wordcount().words
		local chars = vim.fn.wordcount().chars
		return words .. " words " .. chars .. " chars"
	end
	-- return "󰦨 " .. words .. " 󰀫 " .. chars -- 󰦨   󰀬 󰀫
end

local function leftBar()
	return "▌"
end

local function rightBar()
	return "▐"
end

local function fileModified()
	if vim.bo.modified then
		return " "
	else
		return "  "
	end
end

local statusline = require("arrow.statusline")
-- statusline.is_on_arrow_file() -- return nil if current file is not on arrow.  Return the index if it is.
-- statusline.text_for_statusline() -- return the text to be shown in the statusline (the index if is on arrow or "" if not)
-- statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;D

local function arrow()
	return statusline.text_for_statusline_with_icons()
end

local function filename()
	local statusline = require("arrow.statusline")

	return {
		{
			"filename",
			file_status = true,
			symbols = {
				modified = "",
				readonly = "[RO]",
				unnamed = "[No Name]",
				newfile = "[New]",
			},
			separator = "",
			padding = { left = 1, right = 0 },
		},
		{
			fileModified,
			color = { fg = "#9ece6a" },
			padding = 0,
		},
		{
			arrow,
			color = { fg = colors.mauve, bg = colors.black, gui = "bold" },
		},
	}
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		theme = catppuccin,
		-- component_separators = { left = "", right = "" },
		-- component_separators = { left = "|", right = "|" },
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true, -- false
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				leftBar,
				padding = 0,
			},
			{
				"mode",
				-- separator = { left = "[[]]", right = "[[]]" },
				-- separator = { left = "▌", right = "▌" },
				-- separator = "▌",
			},
			{
				rightBar,
				padding = 0,
			},
		},

		-- lualine_b = { "branch", "diff", "diagnostics" },
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = "SelfLualineDiffAdd",
					modified = "SelfLualineDiffModified",
					removed = "SelfLualineDiffRemoved",
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				source = diff_source,
			},
			{
				"diagnostics",
				diagnostics_color = {
					error = "SelfLualineDiagnosticError",
					warn = "SelfLualineDiagnosticWarn",
					info = "SelfLualineDiagnosticInfo",
					hint = "SelfLualineDiagnosticHint",
				},
				symbols = {
					error = "󰅜 ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
		},
		-- lualine_c = { "filename" },
		lualine_c = filename(),
		lualine_x = {
			{
				wordStats,
				cond = function()
					if vim.bo.filetype == "text" or vim.bo.filetype == "markdown" then
						return true
					else
						return false
					end
				end,
				color = { fg = colors.text, bg = colors.surface0, gui = "bold" },
			},
			"encoding",
			"fileformat",
			"filetype",
			{
				lspStatus,
				color = { fg = colors.overlay2, bg = colors.black },
			},
		},
		lualine_y = {
			{
				leftBar,
				padding = 0,
			},
			"progress",
			"selectioncount",
		},
		lualine_z = {
			{
				"location",
				padding = 1,
			},
			{
				rightBar,
				padding = 0,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { "filename" },
		lualine_c = filename(),
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	--   lualine_a = {
	--     "buffers",
	--   },
	--   lualine_z = {
	--     "tabs",
	--   },
	-- },
	winbar = {},
	inactive_winbar = {},
	extensions = { "fzf", "nvim-tree", "trouble", "toggleterm", "oil", "quickfix", "fugitive", "man" },
})
