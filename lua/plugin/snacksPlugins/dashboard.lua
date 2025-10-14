local config = {
	enabled = true,
	zindex = 10,
	height = nil, -- nil for center
	width = nil, -- nil for center
	pane_gap = 4,
	pick = nil, -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
	bo = {
		bufhidden = "wipe",
		buftype = "nofile",
		buflisted = false,
		filetype = "snacks_dashboard",
		swapfile = false,
		undofile = false,
	},
	wo = {
		colorcolumn = "",
		cursorcolumn = false,
		cursorline = false,
		foldmethod = "manual",
		list = false,
		number = false,
		relativenumber = false,
		sidescrolloff = 0,
		signcolumn = "no",
		spell = false,
		statuscolumn = "",
		statusline = "",
		winbar = "",
		winhighlight = "Normal:SnacksDashboardNormal,NormalFloat:SnacksDashboardNormal",
		wrap = false,
	},
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
	-- These settings are used by some built-in sections
	preset = {
		-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
		---@type fun(cmd:string, opts:table)|nil
		pick = "telescope.nvim",
		-- Used by the `keys` section to show keymaps.
		-- Set your custom keymaps here.
		-- When using a function, the `items` argument are the default keymaps.
		---@type snacks.dashboard.Item[]
		keys = {
			{ icon = "   ", key = "n", desc = "New File", action = ":ene | startinsert" },
			{ icon = "   ", key = "v", desc = "Load Session(cwd)", action = ":SessionRestore" },
			{ icon = "󱚄   ", key = "s", desc = "Select Session", action = ":SessionSearch" },
			{ icon = "   ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
			{
				icon = "   ",
				key = "r",
				desc = "Recent Files",
				action = ":lua Snacks.dashboard.pick('oldfiles')",
			},
			{ icon = "   ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
			{ icon = "󰐱   ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
			{
				icon = "   ",
				key = "c",
				desc = "Config",
				action = ":e $MYVIMRC",
			},
			-- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
			{ icon = "   ", key = "q", desc = "Quit", action = ":qa" },
		},
		-- Used by the `header` section
		header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	},
	-- item field formatters
	formats = {
		-- icon = function(item)
		-- 	if item.file and item.icon == "file" or item.icon == "directory" then
		-- 		return M.icon(item.file, item.icon)
		-- 	end
		-- 	return { item.icon, width = 2, hl = "icon" }
		-- end,
		footer = { "%s", align = "center" },
		header = { "%s", align = "center" },
		file = function(item, ctx)
			local fname = vim.fn.fnamemodify(item.file, ":~")
			fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
			if #fname > ctx.width then
				local dir = vim.fn.fnamemodify(fname, ":h")
				local file = vim.fn.fnamemodify(fname, ":t")
				if dir and file then
					file = file:sub(-(ctx.width - #dir - 2))
					fname = dir .. "/…" .. file
				end
			end
			local dir, file = fname:match("^(.*)/(.+)$")
			return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
		end,
	},

	-- github cli theme dashboard
	sections = {
		{ section = "header" },
		-- {
		-- 	pane = 2,
		-- 	section = "terminal",
		-- 	cmd = "colorscript -e square",
		-- 	height = 5,
		-- 	padding = 1,
		-- },
		{ section = "keys", gap = 1, padding = 1 },
		-- {
		-- 	pane = 2,
		-- 	icon = " ",
		-- 	desc = "Browse Repo",
		-- 	padding = 1,
		-- 	key = "b",
		-- 	action = function()
		-- 		Snacks.gitbrowse()
		-- 	end,
		-- },
		-- { section = "keys", gap = 1, padding = 1 },
		{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
		{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
		function()
			local in_git = Snacks.git.get_root() ~= nil
			local cmds = {
				-- {
				-- 	title = "Notifications",
				-- 	cmd = "gh notify -s -a -n5",
				-- 	action = function()
				-- 		vim.ui.open("https://github.com/notifications")
				-- 	end,
				-- 	key = "n",
				-- 	icon = " ",
				-- 	height = 5,
				-- 	enabled = true,
				-- },
				{
					title = "Open Issues",
					cmd = "gh issue list -L 3",
					key = "i",
					action = function()
						vim.fn.jobstart("gh issue list --web", { detach = true })
					end,
					icon = " ",
					height = 7,
				},
				{
					icon = " ",
					title = "Open PRs",
					cmd = "gh pr list -L 3",
					key = "P",
					action = function()
						vim.fn.jobstart("gh pr list --web", { detach = true })
					end,
					height = 7,
				},
				{
					icon = " ",
					title = "Git Status",
					cmd = "git --no-pager diff --stat -B -M -C",
					height = 10,
				},
			}
			return vim.tbl_map(function(cmd)
				return vim.tbl_extend("force", {
					pane = 2,
					section = "terminal",
					enabled = in_git,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				}, cmd)
			end, cmds)
		end,
		{ section = "startup", icon = "󱐋 " },
	},
}

return config
