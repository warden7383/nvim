-- running defaults (below)
---@class snacks.scratch.Config
---@field win? snacks.win.Config scratch window
---@field template? string template for new buffers
---@field file? string scratch file path. You probably don't need to set this.
---@field ft? string|fun():string the filetype of the scratch buffer
local config = {
	enabled = true,
	name = "Scratch",
	ft = function()
		if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
			return vim.bo.filetype
		end
		return "markdown"
	end,
	---@type string|string[]?
	icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
	root = vim.fn.stdpath("data") .. "/scratch",
	autowrite = true, -- automatically write when the buffer is hidden
	-- unique key for the scratch file is based on:
	-- * name
	-- * ft
	-- * vim.v.count1 (useful for keymaps)
	-- * cwd (optional)
	-- * branch (optional)
	filekey = {
		cwd = true, -- use current working directory
		branch = true, -- use current branch name
		count = true, -- use vim.v.count1
	},
	win = {
		style = "scratch",
		width = 0.9,
		height = 0.8,
		wo = { winhighlight = "NormalFloat:NormalFloat" },
	},
	---@type table<string, snacks.win.Config>
	win_by_ft = {
		lua = {
			keys = {
				["source"] = {
					"<cr>",
					function(self)
						local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
						Snacks.debug.run({ buf = self.buf, name = name })
					end,
					desc = "Source buffer",
					mode = { "n", "x" },
				},
			},
		},
	},
}

return config
