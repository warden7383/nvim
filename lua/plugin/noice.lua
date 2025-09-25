require("noice").setup({
	cmdline = {
		enabled = true, -- enables the Noice cmdline UI
		view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		opts = {}, -- global options for the cmdline. See section on views
		---@type table<string, CmdlineFormat>
		format = {
			-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			-- view: (default is cmdline view)
			-- opts: any options passed to the view
			-- icon_hl_group: optional hl_group for the icon
			-- title: set to anything or empty string to hide
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			input = {}, -- Used by input()
			-- lua = false, -- to disable a format, set to `false`
		},
	},
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
		---@type 'nui'|'cmp'
		backend = "cmp", -- backend to use to show regular cmdline completions
		---@type NoicePopupmenuItemKind|false
		-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
		kind_icons = {}, -- set to `false` to disable icons
	},
	-- default options for require('noice').redirect
	-- see the section on Command Redirection
	---@type NoiceRouteConfig
	redirect = {
		view = "popup",
		filter = { event = "msg_show" },
	},
	-- You can add any custom commands below that will be available with `:Noice command`
	---@type table<string, NoiceCommand>
	commands = {
		history = {
			-- options for the message history that you get with `:Noice`
			view = "split",
			opts = { enter = true, format = "details" },
			filter = {
				any = {
					{ event = "notify" },
					{ error = true },
					{ warning = true },
					{ event = "msg_show", kind = { "" } },
					{ event = "lsp", kind = "message" },
				},
			},
		},
		-- :Noice last
		last = {
			view = "popup",
			opts = { enter = true, format = "details" },
			filter = {
				any = {
					{ event = "notify" },
					{ error = true },
					{ warning = true },
					{ event = "msg_show", kind = { "" } },
					{ event = "lsp", kind = "message" },
				},
			},
			filter_opts = { count = 1 },
		},
		-- :Noice errors
		errors = {
			-- options for the message history that you get with `:Noice`
			view = "popup",
			opts = { enter = true, format = "details" },
			filter = { error = true },
			filter_opts = { reverse = true },
		},
	},
	notify = {
		-- Noice can be used as `vim.notify` so you can route any notification like other messages
		-- Notification messages have their level and other properties set.
		-- event is always "notify" and kind can be any log level as a string
		-- The default routes will forward notifications to nvim-notify
		-- Benefit of using Noice for this is the routing and consistent history view
		enabled = false,
		view = "notify",
	},
	lsp = {
		progress = {
			enabled = false,
			-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
			-- See the section on formatting for more details on how to customize.
			--- @type NoiceFormat|string
			format = "lsp_progress",
			--- @type NoiceFormat|string
			format_done = "lsp_progress_done",
			throttle = 1000 / 30, -- frequency to update lsp progress message
			view = "mini",
		},
		override = {
			-- override the default lsp markdown formatter with Noice
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- override the lsp markdown formatter with Noice
			["vim.lsp.util.stylize_markdown"] = true,
			-- override cmp documentation with Noice (needs the other options to work)
			["cmp.entry.get_documentation"] = true,
		},
		hover = {
			enabled = false,
			silent = false, -- set to true to not show a message if hover is not available
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		signature = {
			enabled = false,
			auto_open = {
				enabled = true,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		message = {
			-- Messages shown by lsp servers
			enabled = true,
			view = "notify",
			opts = {},
		},
		-- defaults for hover and signature help
		documentation = {
			view = "hover",
			---@type NoiceViewOptions
			opts = {
				lang = "markdown",
				replace = true,
				render = "plain",
				format = { "{message}" },
				win_options = { concealcursor = "n", conceallevel = 3 },
			},
		},
	},
	markdown = {
		hover = {
			["|(%S-)|"] = vim.cmd.help, -- vim help links
			["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
		},
		highlights = {
			["|%S-|"] = "@text.reference",
			["@%S+"] = "@parameter",
			["^%s*(Parameters:)"] = "@text.title",
			["^%s*(Return:)"] = "@text.title",
			["^%s*(See also:)"] = "@text.title",
			["{%S-}"] = "@parameter",
		},
	},
	-- health = {
	--   checker = true, -- Disable if you don't want health checks to run
	-- },
	smart_move = {
		-- noice tries to move out of the way of existing floating windows.
		enabled = true, -- you can disable this behaviour here
		-- add any filetypes here, that shouldn't trigger smart move.
		excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
	},
	---@type NoicePresets
	presets = {
		-- you can enable a preset by setting it to true, or a table that will override the preset config
		-- you can also add custom presets that you can enable/disable with enabled=true
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = true, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
	throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
	---@type NoiceConfigViews
	-- views = {}, ---@see section on views
	views = {
		cmdline_popup = {
			position = {
				row = 10,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		-- popupmenu = {
		--   relative = "editor",
		--   position = {
		--     row = 8,
		--     col = "50%",
		--   },
		--   size = {
		--     width = 60,
		--     height = 10,
		--   },
		--   border = {
		--     style = "rounded",
		--     padding = { 0, 1 },
		--   },
		--   win_options = {
		--     winhighlight = { Normal = "Normal", FloatBoard = "DiagnosticInfo" },
		--   },
		-- },
	}, ---@see section on views
	---@type NoiceRouteConfig[]
	routes = {
		--{
		--  NOTE: "mini" seems to be the best to showing macro recording mode, notify is annoying
		-- view = "mini",
		-- filter = { event = "msg_showmode" },
		--},
		{
			view = "split",
			filter = {
				event = "msg_show",
				min_height = 20,
			},
		},
	}, --- @see section on routes
	---@type table<string, NoiceFilter>
	status = {}, --- @see section on statusline components
	---@type NoiceFormatOptions
	format = {}, --- @see section on formatting
})

-- TODO: adjust this
-- NOTE: the `:NoiceConfig` output of the config
-- {
--   cmdline = {
--     enabled = true,
--     format = {
--       IncRename = {
--         conceal = true,
--         icon = " ",
--         icon_hl_group = "NoiceCmdlineIconIncRename",
--         kind = "IncRename",
--         opts = <1>{
--           border = {
--             text = {
--               top = " IncRename "
--             }
--           },
--           position = {
--             col = 0,
--             row = -3
--           },
--           relative = "cursor",
--           size = {
--             min_width = 20
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderIncRename"
--             }
--           }
--         },
--         pattern = "^:%s*IncRename%s+",
--         view = "cmdline_popup"
--       },
--       calculator = {
--         conceal = true,
--         icon = "",
--         icon_hl_group = "NoiceCmdlineIconCalculator",
--         kind = "calculator",
--         lang = "vimnormal",
--         opts = <2>{
--           border = {
--             text = {
--               top = " Calculator "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderCalculator"
--             }
--           }
--         },
--         pattern = "^=",
--         view = "cmdline_popup"
--       },
--       cmdline = {
--         conceal = true,
--         icon = "",
--         icon_hl_group = "NoiceCmdlineIconCmdline",
--         kind = "cmdline",
--         lang = "vim",
--         opts = <3>{
--           border = {
--             text = {
--               top = " Cmdline "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderCmdline"
--             }
--           }
--         },
--         pattern = "^:",
--         view = "cmdline_popup"
--       },
--       filter = {
--         conceal = true,
--         icon = "$",
--         icon_hl_group = "NoiceCmdlineIconFilter",
--         kind = "filter",
--         lang = "bash",
--         opts = <4>{
--           border = {
--             text = {
--               top = " Filter "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderFilter"
--             }
--           }
--         },
--         pattern = "^:%s*!",
--         view = "cmdline_popup"
--       },
--       help = {
--         conceal = true,
--         icon = "",
--         icon_hl_group = "NoiceCmdlineIconHelp",
--         kind = "help",
--         opts = <5>{
--           border = {
--             text = {
--               top = " Help "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderHelp"
--             }
--           }
--         },
--         pattern = "^:%s*he?l?p?%s+",
--         view = "cmdline_popup"
--       },
--       input = {
--         conceal = true,
--         icon_hl_group = "NoiceCmdlineIconInput",
--         kind = "input",
--         opts = <6>{
--           border = {
--             text = {
--               top = " Input "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderInput"
--             }
--           }
--         },
--         view = "cmdline_popup"
--       },
--       lua = {
--         conceal = true,
--         icon = "",
--         icon_hl_group = "NoiceCmdlineIconLua",
--         kind = "lua",
--         lang = "lua",
--         opts = <7>{
--           border = {
--             text = {
--               top = " Lua "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderLua"
--             }
--           }
--         },
--         pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
--         view = "cmdline_popup"
--       },
--       search_down = {
--         conceal = true,
--         icon = " ",
--         icon_hl_group = "NoiceCmdlineIconSearch",
--         kind = "search",
--         lang = "regex",
--         opts = <8>{
--           border = {
--             text = {
--               top = " Search "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderSearch"
--             }
--           }
--         },
--         pattern = "^/",
--         view = "cmdline_popup"
--       },
--       search_up = {
--         conceal = true,
--         icon = " ",
--         icon_hl_group = "NoiceCmdlineIconSearch",
--         kind = "search",
--         lang = "regex",
--         opts = <9>{
--           border = {
--             text = {
--               top = " Search "
--             }
--           },
--           win_options = {
--             winhighlight = {
--               FloatBorder = "NoiceCmdlinePopupBorderSearch"
--             }
--           }
--         },
--         pattern = "^%?",
--         view = "cmdline_popup"
--       }
--     },
--     opts = <10>{},
--     view = "cmdline_popup"
--   },
--   commands = {
--     errors = {
--       filter = {
--         error = true
--       },
--       filter_opts = {
--         reverse = true
--       },
--       opts = {
--         enter = true,
--         format = "details"
--       },
--       view = "popup"
--     },
--     history = {
--       filter = {
--         any = { {
--             event = "notify"
--           }, {
--             error = true
--           }, {
--             warning = true
--           }, {
--             event = "msg_show",
--             kind = { "" }
--           }, {
--             event = "lsp",
--             kind = "message"
--           } }
--       },
--       opts = {
--         enter = true,
--         format = "details"
--       },
--       view = "split"
--     },
--     last = {
--       filter = {
--         any = { {
--             event = "notify"
--           }, {
--             error = true
--           }, {
--             warning = true
--           }, {
--             event = "msg_show",
--             kind = { "" }
--           }, {
--             event = "lsp",
--             kind = "message"
--           } }
--       },
--       filter_opts = {
--         count = 1
--       },
--       opts = {
--         enter = true,
--         format = "details"
--       },
--       view = "popup"
--     }
--   },
--   debug = false,
--   format = {
--     cmdline = {},
--     confirm = {
--       hl_group = {
--         choice = "NoiceFormatConfirm",
--         default_choice = "NoiceFormatConfirmDefault"
--       }
--     },
--     data = {},
--     date = {
--       format = "%X",
--       hl_group = "NoiceFormatDate"
--     },
--     debug = {
--       enabled = true
--     },
--     event = {
--       hl_group = "NoiceFormatEvent"
--     },
--     kind = {
--       hl_group = "NoiceFormatKind"
--     },
--     level = {
--       hl_group = {
--         debug = "NoiceFormatLevelDebug",
--         error = "NoiceFormatLevelError",
--         info = "NoiceFormatLevelInfo",
--         off = "NoiceFormatLevelOff",
--         trace = "NoiceFormatLevelTrace",
--         warn = "NoiceFormatLevelWarn"
--       },
--       icons = {
--         error = " ",
--         info = " ",
--         warn = " "
--       }
--     },
--     message = {},
--     progress = {
--       align = "right",
--       contents = {},
--       hl_group = "NoiceFormatProgressTodo",
--       hl_group_done = "NoiceFormatProgressDone",
--       key = "progress",
--       width = 20
--     },
--     spinner = {
--       name = "dots"
--     },
--     text = {},
--     title = {
--       hl_group = "NoiceFormatTitle"
--     }
--   },
--   health = {
--     checker = true
--   },
--   log = "C:\\Users\\Andrew Ng\\AppData\\Local\\nvim-data/noice.log",
--   log_max_size = 2097152,
--   lsp = {
--     documentation = {
--       opts = {
--         format = <11>{ "{message}" },
--         lang = "markdown",
--         render = "plain",
--         replace = true,
--         win_options = <12>{
--           concealcursor = "n",
--           conceallevel = 3
--         }
--       },
--       view = "hover"
--     },
--     hover = {
--       enabled = false,
--       opts = {},
--       silent = false
--     },
--     message = {
--       enabled = true,
--       opts = <13>{},
--       view = "notify"
--     },
--     override = {
--       ["cmp.entry.get_documentation"] = true,
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true
--     },
--     progress = {
--       enabled = false,
--       format = "lsp_progress",
--       format_done = "lsp_progress_done",
--       throttle = 33.333333333333,
--       view = "mini"
--     },
--     signature = {
--       auto_open = {
--         enabled = true,
--         luasnip = true,
--         throttle = 50,
--         trigger = true
--       },
--       enabled = false,
--       opts = {}
--     }
--   },
--   markdown = {
--     highlights = {
--       ["@%S+"] = "@parameter",
--       ["^%s*(Parameters:)"] = "@text.title",
--       ["^%s*(Return:)"] = "@text.title",
--       ["^%s*(See also:)"] = "@text.title",
--       ["{%S-}"] = "@parameter",
--       ["|%S-|"] = "@text.reference"
--     },
--     hover = {
--       ["%[.-%]%((%S-)%)"] = <function 1>,
--       ["|(%S-)|"] = <function 2>
--     }
--   },
--   messages = {
--     enabled = true,
--     view = "notify",
--     view_error = "notify",
--     view_history = "messages",
--     view_search = "virtualtext",
--     view_warn = "notify"
--   },
--   notify = {
--     enabled = true,
--     view = "notify"
--   },
--   popupmenu = {
--     backend = "cmp",
--     enabled = true,
--     kind_icons = {
--       Class = " ",
--       Color = " ",
--       Constant = " ",
--       Constructor = " ",
--       Enum = "了 ",
--       EnumMember = " ",
--       Field = " ",
--       File = " ",
--       Folder = " ",
--       Function = " ",
--       Interface = " ",
--       Keyword = " ",
--       Method = "ƒ ",
--       Module = " ",
--       Property = " ",
--       Snippet = " ",
--       Struct = " ",
--       Text = " ",
--       Unit = " ",
--       Value = " ",
--       Variable = " "
--     }
--   },
--   presets = {
--     bottom_search = false,
--     cmdline_output_to_split = false,
--     command_palette = true,
--     inc_rename = true,
--     long_message_to_split = true,
--     lsp_doc_border = true
--   },
--   redirect = {
--     filter = {
--       event = "msg_show"
--     },
--     view = "popup"
--   },
--   routes = { {
--       filter = {
--         event = "msg_show",
--         min_height = 20
--       },
--       view = "split"
--     }, {
--       filter = {
--         event = "msg_show",
--         min_height = 20
--       },
--       view = "cmdline_output"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "calculator"
--       },
--       opts = <table 2>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "search"
--       },
--       opts = <table 9>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "cmdline"
--       },
--       opts = <table 3>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "filter"
--       },
--       opts = <table 4>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "search"
--       },
--       opts = <table 8>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "lua"
--       },
--       opts = <table 7>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "IncRename"
--       },
--       opts = <table 1>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "help"
--       },
--       opts = <table 5>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "cmdline",
--         kind = "input"
--       },
--       opts = <table 6>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         event = "lsp",
--         kind = "signature"
--       },
--       opts = {
--         format = <table 11>,
--         lang = "markdown",
--         render = "plain",
--         replace = true,
--         win_options = <table 12>
--       },
--       view = "hover"
--     }, {
--       filter = {
--         event = "lsp",
--         kind = "hover"
--       },
--       opts = {
--         format = <table 11>,
--         lang = "markdown",
--         render = "plain",
--         replace = true,
--         win_options = <table 12>
--       },
--       view = "hover"
--     }, {
--       filter = {
--         event = "cmdline"
--       },
--       opts = <table 10>,
--       view = "cmdline_popup"
--     }, {
--       filter = {
--         any = { {
--             event = "msg_show",
--             kind = "confirm"
--           }, {
--             event = "msg_show",
--             kind = "confirm_sub"
--           } }
--       },
--       view = "confirm"
--     }, {
--       filter = {
--         any = { {
--             event = "msg_history_show"
--           } }
--       },
--       view = "messages"
--     }, {
--       filter = {
--         event = "msg_show",
--         kind = "search_count"
--       },
--       view = "virtualtext"
--     }, {
--       filter = {
--         any = { {
--             event = { "msg_showmode", "msg_showcmd", "msg_ruler" }
--           }, {
--             event = "msg_show",
--             kind = "search_count"
--           } }
--       },
--       opts = {
--         skip = true
--       }
--     }, {
--       filter = {
--         event = "msg_show",
--         kind = { "", "echo", "echomsg" }
--       },
--       opts = {
--         merge = true,
--         replace = true,
--         title = "Messages"
--       },
--       view = "notify"
--     }, {
--       filter = {
--         error = true
--       },
--       opts = {
--         title = "Error"
--       },
--       view = "notify"
--     }, {
--       filter = {
--         warning = true
--       },
--       opts = {
--         title = "Warning"
--       },
--       view = "notify"
--     }, {
--       filter = {
--         event = "notify"
--       },
--       opts = {
--         title = "Notify"
--       },
--       view = "notify"
--     }, {
--       filter = {
--         event = "noice",
--         kind = { "stats", "debug" }
--       },
--       opts = {
--         lang = "lua",
--         replace = true,
--         title = "Noice"
--       },
--       view = "notify"
--     }, {
--       filter = {
--         event = "lsp",
--         kind = "progress"
--       },
--       view = "mini"
--     }, {
--       filter = {
--         event = "lsp",
--         kind = "message"
--       },
--       opts = <table 13>,
--       view = "notify"
--     } },
--   smart_move = {
--     enabled = true,
--     excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" }
--   },
--   status = {
--     command = {
--       event = "msg_showcmd"
--     },
--     message = {
--       event = "msg_show"
--     },
--     mode = {
--       event = "msg_showmode"
--     },
--     ruler = {
--       event = "msg_ruler"
--     },
--     search = {
--       event = "msg_show",
--       kind = "search_count"
--     }
--   },
--   throttle = 33.333333333333,
--   views = {
--     cmdline = {
--       backend = "popup",
--       border = {
--         style = "none"
--       },
--       position = {
--         col = 0,
--         row = "100%"
--       },
--       relative = "editor",
--       size = {
--         height = "auto",
--         width = "100%"
--       },
--       win_options = {
--         winhighlight = {
--           CurSearch = "",
--           IncSearch = "",
--           Normal = "NoiceCmdline",
--           Search = ""
--         }
--       }
--     },
--     cmdline_output = {
--       format = "details",
--       view = "split"
--     },
--     cmdline_popup = {
--       backend = "popup",
--       border = {
--         padding = { 0, 1 },
--         style = "rounded"
--       },
--       enter = false,
--       focusable = false,
--       position = {
--         col = "50%",
--         row = 10
--       },
--       relative = "editor",
--       size = {
--         height = "auto",
--         min_width = 60,
--         width = 60
--       },
--       win_options = {
--         cursorline = false,
--         foldenable = false,
--         winbar = "",
--         winhighlight = {
--           CurSearch = "",
--           FloatBorder = "NoiceCmdlinePopupBorder",
--           FloatTitle = "NoiceCmdlinePopupTitle",
--           IncSearch = "",
--           Normal = "NoiceCmdlinePopup",
--           Search = ""
--         }
--       },
--       zindex = 200
--     },
--     cmdline_popupmenu = {
--       border = {
--         padding = { 0, 1 },
--         style = "rounded"
--       },
--       position = {
--         col = "50%",
--         row = 6
--       },
--       relative = "editor",
--       size = {
--         height = "auto",
--         max_height = 15,
--         width = 60
--       },
--       view = "popupmenu",
--       win_options = {
--         winhighlight = {
--           FloatBorder = "NoiceCmdlinePopupBorder",
--           Normal = "Normal"
--         }
--       },
--       zindex = 200
--     },
--     confirm = {
--       align = "center",
--       backend = "popup",
--       border = {
--         padding = { 0, 1 },
--         style = "rounded",
--         text = {
--           top = " Confirm "
--         }
--       },
--       enter = false,
--       focusable = false,
--       format = { "{confirm}" },
--       position = {
--         col = "50%",
--         row = "50%"
--       },
--       relative = "editor",
--       size = "auto",
--       win_options = {
--         foldenable = false,
--         winbar = "",
--         winhighlight = {
--           FloatBorder = "NoiceConfirmBorder",
--           Normal = "NoiceConfirm"
--         }
--       },
--       zindex = 210
--     },
--     hover = {
--       anchor = "auto",
--       border = {
--         padding = { 0, 2 },
--         style = "rounded"
--       },
--       enter = false,
--       position = {
--         col = 2,
--         row = 2
--       },
--       relative = "cursor",
--       size = {
--         height = "auto",
--         max_height = 20,
--         max_width = 120,
--         width = "auto"
--       },
--       view = "popup",
--       win_options = {
--         linebreak = true,
--         wrap = true
--       },
--       zindex = 45
--     },
--     messages = {
--       enter = true,
--       view = "split"
--     },
--     mini = {
--       align = "message-right",
--       backend = "mini",
--       border = {
--         style = "none"
--       },
--       focusable = false,
--       position = {
--         col = "100%",
--         row = -1
--       },
--       relative = "editor",
--       reverse = true,
--       size = "auto",
--       timeout = 2000,
--       win_options = {
--         foldenable = false,
--         winbar = "",
--         winblend = 30,
--         winhighlight = {
--           CurSearch = "",
--           IncSearch = "",
--           Normal = "NoiceMini",
--           Search = ""
--         }
--       },
--       zindex = 60
--     },
--     notify = {
--       backend = "notify",
--       fallback = "mini",
--       format = "notify",
--       merge = false,
--       replace = false
--     },
--     popup = {
--       backend = "popup",
--       border = {
--         style = "rounded"
--       },
--       close = {
--         events = { "BufLeave" },
--         keys = { "q" }
--       },
--       enter = true,
--       position = "50%",
--       relative = "editor",
--       size = {
--         height = "20",
--         width = "120"
--       },
--       win_options = {
--         foldenable = false,
--         winbar = "",
--         winhighlight = {
--           FloatBorder = "NoicePopupBorder",
--           Normal = "NoicePopup"
--         }
--       }
--     },
--     popupmenu = {
--       border = {
--         padding = { 0, 1 }
--       },
--       position = "auto",
--       relative = "editor",
--       size = {
--         height = "auto",
--         max_height = 20,
--         width = "auto"
--       },
--       win_options = {
--         cursorline = true,
--         cursorlineopt = "line",
--         foldenable = false,
--         winbar = "",
--         winhighlight = {
--           CursorLine = "NoicePopupmenuSelected",
--           FloatBorder = "NoicePopupmenuBorder",
--           Normal = "NoicePopupmenu",
--           PmenuMatch = "NoicePopupmenuMatch"
--         }
--       },
--       zindex = 65
--     },
--     split = {
--       backend = "split",
--       close = {
--         keys = { "q" }
--       },
--       enter = false,
--       position = "bottom",
--       relative = "editor",
--       size = "20%",
--       win_options = {
--         winhighlight = {
--           FloatBorder = "NoiceSplitBorder",
--           Normal = "NoiceSplit"
--         },
--         wrap = true
--       }
--     },
--     virtualtext = {
--       backend = "virtualtext",
--       format = { "{message}" },
--       hl_group = "NoiceVirtualText"
--     },
--     vsplit = {
--       position = "right",
--       view = "split"
--     }
--   }
-- }
