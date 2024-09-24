local resession = require("resession")

resession.setup({
	-- Options for automatically saving sessions on a timer
	autosave = {
		enabled = false,
		-- How often to save (in seconds)
		interval = 60,
		-- Notify when autosaved
		notify = true,
	},
	-- Save and restore these options
	options = {
		"binary",
		"bufhidden",
		"buflisted",
		"cmdheight",
		"diff",
		"filetype",
		"modifiable",
		"previewwindow",
		"readonly",
		"scrollbind",
		"winfixheight",
		"winfixwidth",
	},
	-- Custom logic for determining if the buffer should be included
	buf_filter = require("resession").default_buf_filter,
	-- Custom logic for determining if a buffer should be included in a tab-scoped session
	tab_buf_filter = function(tabpage, bufnr)
		return true
	end,
	-- The name of the directory to store sessions in
	dir = "session",
	-- Show more detail about the sessions when selecting one to load.
	-- Disable if it causes lag.
	load_detail = true,
	-- List order ["modification_time", "creation_time", "filename"]
	load_order = "modification_time",
	-- Configuration for extensions
	extensions = {
		quickfix = {},
	},
})

-- resession.setup()

function Resession_save()
	-- print("saved")
	resession.save()
end

function Resession_load()
	-- print("loaded")
	resession.load()
end

function Resession_delete()
	-- print("deleted")
	resession.delete()
end

-- Resession does NOTHING automagically, so we have to set up some keymaps
-- vim.keymap.set("n", "<leader>ss", resession.save)
-- vim.keymap.set("n", "<leader>sl", resession.load)
-- vim.keymap.set("n", "<leader>sd", resession.delete)

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		-- Always save a special session named "last"
		resession.save("last")
	end,
})

vim.api.nvim_create_user_command("ResessionSave", "lua Resession_save()", { bang = false })
vim.api.nvim_create_user_command("ResessionLoad", "lua Resession_load()", { bang = false })
vim.api.nvim_create_user_command("ResessionDelete", "lua Resession_delete()", { bang = false })

-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = function()
--     resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
--   end,
-- })
