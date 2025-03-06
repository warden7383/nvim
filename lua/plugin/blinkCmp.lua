local config = {
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-e: Hide menu
	-- C-k: Toggle signature help
	--
	-- See the full "keymap" documentation for information on defining your own keymap.
	keymap = { preset = "default" },

	appearance = {
		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- Useful for when your theme doesn't support blink.cmp
		-- Will be removed in a future release
		use_nvim_cmp_as_default = true,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	completion = {},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {},

	cmdline = {
		enabled = true,
		keymap = { preset = "cmdline" },
		sources = function()
			local type = vim.fn.getcmdtype()
			-- Search forward and backward
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			-- Commands
			if type == ":" or type == "@" then
				return { "cmdline" }
			end
			return {}
		end,
		completion = {
			trigger = {
				show_on_blocked_trigger_characters = {},
				show_on_x_blocked_trigger_characters = {},
			},
			list = {
				selection = {
					-- When `true`, will automatically select the first item in the completion list
					preselect = true,
					-- When `true`, inserts the completion item automatically when selecting it
					auto_insert = true,
				},
			},
			-- Whether to automatically show the window when new completion items are available
			menu = { auto_show = true },
			-- Displays a preview of the selected item on the current line
			ghost_text = { enabled = true },
		},
	},

	-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },
}

return config
