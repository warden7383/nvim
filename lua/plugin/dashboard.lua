require("dashboard").setup({
	theme = "doom",
	disable_move = false,
	shortcut_type = "letter",
	change_to_vcs_root = false,
	config = {
		header = {},
		-- week_header = {
		--
		-- },
		disable_move = false,
		center = {
			{
				icon = "",
				icon_hl = "Title", --group
				desc = "Find File        ",
				desc_hl = "String",
				key = "b",
				keymap = "SPC f f",
				key_hl = "Number",
				key_format = " [%s]", -- `%s` will be substituted with value of `key`
				action = "lua print(2)",
			},
			{
				icon = "",
				desc = "Find Dotfiles        ",
				key = "f",
				keymap = "SPC f d",
				key_hl = "Number",
				key_format = " [%s]", -- `%s` will be substituted with value of `key`
				action = "lua print(3)",
			},
		},
		footer = {},
	},
	hide = {
		statusline = true,
		tabline = true,
		winbar = true,
	},
	preview = {
		command,
		file_path,
		file_height,
		file_width,
	},
}) 












