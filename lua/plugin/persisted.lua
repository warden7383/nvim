local ft = vim.bo.filetype
require("persisted").setup({
	save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
	silent = false, -- silent nvim message when sourcing session file
	use_git_branch = true, -- create session files based on the branch of a git enabled repository
	default_branch = "main", -- the branch to load if a session file is not found for the current branch
	autosave = true, -- automatically save session files when exiting Neovim
	should_autosave = function() -- function to determine if a session should be autosaved
		if vim.bo.filetype == "alpha" then
			print("encountered a filetype don't save")
			return false
		elseif vim.bo.filetype == "NvimTree" then
			return false
		elseif vim.bo.filetype == "checkhealth" then
			return false
		end
		return true
	end,

	autoload = false, -- automatically load the session for the cwd on Neovim startup
	on_autoload_no_session = function() -- function to run when `autoload = true` but there is no session to load
		vim.notify("No existing session to load.")
	end,
	follow_cwd = true, -- change session file name to match current working directory if it changes
	allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
	ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
	telescope = {
		reset_prompt = true, -- Reset the Telescope prompt after an action?
	},
})

require("telescope").load_extension("persisted")
-- vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,terminal,winsize,options" --each word enables saving and restoring something -- WARN: cursor disappears/creates a ton of weird buffers indicating path does not exist?
