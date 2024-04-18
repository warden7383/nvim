require("colorful-winsep").setup({
	-- highlight for Window separator
	highlight = {
		-- bg = "#16161E",
		fg = "#c6a0f6", --#1F3442
	},
	-- timer refresh rate
	interval = 30,
	-- This plugin will not be activated for filetype in the following table.
	no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
	-- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
	symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
	-- symbols = {"─", "│", "┌", "┐", "└", "┘"},
	close_event = function()
		-- Executed after closing the window separator
	end,
	create_event = function()
		local win_n = require("colorful-winsep.utils").calculate_number_windows()
		if win_n == 2 then
			require("colorful-winsep").NvimSeparatorDel()
		end
		-- Executed after creating the window separator
	end,
})
