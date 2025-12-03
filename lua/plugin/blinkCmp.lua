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
	keymap = {
		preset = "default",
		["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide" }, -- hides completion
		["<Tab>"] = { "select_and_accept", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "snippet_forward", "select_prev", "fallback_to_mappings" },
		["<C-n>"] = { "snippet_backward", "select_next", "fallback_to_mappings" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		-- ["<Tab>"] = { "snippet_forward", "fallback" },
		-- ["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},

	appearance = {
		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- Useful for when your theme doesn't support blink.cmp
		-- Will be removed in a future release
		use_nvim_cmp_as_default = false,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	completion = {
		trigger = {
			show_on_keyword = true, -- what does this do
			prefetch_on_insert = true,
			show_in_snippet = true, -- show completion menu in snippet
		},

		accept = {
			auto_brackets = { enabled = true },
		},

		list = {
			selection = { preselect = true, auto_insert = true },
			max_items = 200,
		},

		menu = {
			enabled = true,
			min_width = 15,
			max_height = 10,
			border = "rounded",
			winblend = 0,
			winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			-- keep the cursor X lines away from the top/bottom of the window
			scrolloff = 2,
			-- note that the gutter will be disabled when border ~= 'none'
			scrollbar = true,
			-- which directions to show the window,
			-- falling back to the next direction when there's not enough space
			direction_priority = { "s", "n" },
			-- which direction previous/next items show up
			-- TODO: implement
			order = { n = "bottom_up", s = "top_down" },

			-- Whether to automatically show the window when new completion items are available
			auto_show = true,

			-- Screen coordinates of the command line
			cmdline_position = function()
				if vim.g.ui_cmdline_pos ~= nil then
					local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
					return { pos[1], pos[2] + 4 } -- first arg: rows, second arg: cols returns the position of the completion menu
				end
				local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
				return { vim.o.lines - height, 0 }
			end,

			draw = {
				align_to = "label",
				padding = 2,
				gap = 2,
				components = {
					kind = {
						ellipsis = true,
					},

					kind_icon = {
						ellipsis = true,
						text = function(ctx)
							local lspkind = require("lspkind")
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
							end

							return icon .. ctx.icon_gap
						end,

						-- Optionally, use the highlight groups from nvim-web-devicons
						-- You can also add the same function for `kind.highlight` if you want to
						-- keep the highlight groups in sync with the icons.
						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
				columns = {
					{ "kind_icon", "label", "label_description", gap = 2 },
					-- { "kind_icon", "kind" },
					{ "kind" },
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			update_delay_ms = 50,
			treesitter_highlighting = true,
			draw = function(opts)
				opts.default_implementation()
			end,
			window = {
				min_width = 10,
				max_width = 80,
				max_height = 20,
				desired_min_width = 50,
				desired_min_height = 10,
				border = "rounded",
				winblend = 0,
				winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
				scrollbar = true,
				direction_priority = {
					menu_north = { "e", "w", "n", "s" },
					menu_south = { "e", "w", "s", "n" },
				},
			},
		},
		ghost_text = {
			enabled = true,
			show_with_selection = true,
			show_without_selection = false,
			show_with_menu = true,
			show_without_menu = true,
		},
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
		default = { "lsp", "path", "snippets", "buffer" },
		-- providers = {
		-- 	"snippets",
		-- },
		-- You may also define providers per filetype
		per_filetype = {
			-- lua = { 'lsp', 'path' },
		},

		-- Function to use when transforming the items before they're returned for all providers
		-- The default will lower the score for snippets to sort them lower in the list
		transform_items = function(_, items)
			return items
		end,

		-- Minimum number of characters in the keyword to trigger all providers
		-- May also be `function(ctx: blink.cmp.Context): number`
		min_keyword_length = 0,
		providers = {
			lsp = {
				name = "LSP",
				module = "blink.cmp.sources.lsp",
				fallbacks = { "buffer" },
				transform_items = function(_, items)
					-- filter out text items, since we have the buffer source
					return vim.tbl_filter(function(item)
						return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
					end, items)
				end,
			},
			path = {
				name = "Path",
				module = "blink.cmp.sources.path",
				score_offset = 3,
				fallbacks = { "buffer" },
			},
			snippets = {
				name = "Snippets",
				module = "blink.cmp.sources.snippets",
				score_offset = -3,
			},
			buffer = {
				name = "Buffer",
				module = "blink.cmp.sources.buffer",
				score_offset = -3,
			},
			cmdline = {
				name = "cmdline",
				module = "blink.cmp.sources.cmdline",
			},
			omni = {
				name = "Omni",
				module = "blink.cmp.sources.complete_func",
				enabled = function()
					return vim.bo.omnifunc ~= "v:lua.vim.lsp.omnifunc"
				end,
				---@type blink.cmp.CompleteFuncOpts
				opts = {
					complete_func = function()
						return vim.bo.omnifunc
					end,
				},
			},
			-- NOTE: in future we may want a built-in terminal source. For now
			-- the infrastructure exists, e.g. so community terminal sources can be
			-- added, but this functionality is not baked into blink.cmp.
			-- term = {
			--   name = 'term',
			--   module = 'blink.cmp.sources.term',
			-- },
		},
	},

	signature = {
		enabled = true,
		trigger = {
			enabled = true,
			show_on_keyword = false,
			blocked_trigger_characters = {},
			blocked_retrigger_characters = {},
			show_on_trigger_character = true,
			show_on_insert = false,
			show_on_insert_on_trigger_character = true,
		},
		window = {
			min_width = 1,
			max_width = 100,
			max_height = 10,
			border = "rounded",
			winblend = 0,
			winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
			scrollbar = false,
			direction_priority = { "n", "s" },
			treesitter_highlighting = true,
			show_documentation = false,
		},
	},
	-- experimental

	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
			["<Tab>"] = { "select_and_accept", "fallback" },
		},
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
			menu = {
				auto_show = true,
				-- min_width = 40,
			},
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
