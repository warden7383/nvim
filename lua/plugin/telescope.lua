local fb_actions = require("telescope._extensions.file_browser.actions")
local telescope = require("telescope")
local actions = require("telescope.actions")

-- NOTE: <C-f> and <C-k> to scroll left and right respectively in preview window won't be available till telescope 2.0 release
-- (currently avail in nightly telescope)
-- https://github.com/nvim-telescope/telescope.nvim/issues/3110
telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = "󱡁   ", --󱡁  
		entry_prefix = "    ",
		multi_icon = " 󰣉 ", --✔ 󰣉
		border = true,
		dynamic_preview_title = false,
	},
	mappings = {
		i = {
			-- ["<ESC>"] = actions.close,
		},
		n = {
			-- ["<C-h>"] = actions.results_scrolling_left,
			-- ["<C-l>"] = actions.results_scrolling_right,
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},

		file_browser = {
			path = vim.uv.cwd(),
			cwd = vim.uv.cwd(),
			cwd_to_path = false,
			grouped = false,
			files = true,
			add_dirs = true,
			depth = 1,
			auto_depth = false,
			select_buffer = false,
			hidden = { file_browser = true, folder_browser = true },
			respect_gitignore = vim.fn.executable("fd") == 1,
			no_ignore = false,
			follow_symlinks = false,
			browse_files = require("telescope._extensions.file_browser.finders").browse_files,
			browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
			hide_parent_dir = false,
			collapse_dirs = false,
			prompt_path = false,
			quiet = false,
			dir_icon = "",
			dir_icon_hl = "Default",
			display_stat = { date = true, size = true, mode = true },
			hijack_netrw = false,
			use_fd = true,
			git_status = true,
			mappings = {
				["i"] = {
					["<A-c>"] = fb_actions.create,
					["<S-CR>"] = fb_actions.create_from_prompt,
					["<A-r>"] = fb_actions.rename,
					["<A-m>"] = fb_actions.move,
					["<A-y>"] = fb_actions.copy,
					["<A-d>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-g>"] = fb_actions.goto_parent_dir,
					["<C-e>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-t>"] = fb_actions.change_cwd,
					["<C-f>"] = fb_actions.toggle_browser,
					["<C-h>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
				},
				["n"] = {
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["x"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["-"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["t"] = fb_actions.change_cwd,
					["f"] = fb_actions.toggle_browser,
					["h"] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			},
		},
	},
})

telescope.load_extension("fzf")
-- telescope.load_extension("notify") -- using snacks notifier
telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
map("n", "<leader>fc", builtin.highlights, { desc = "Find Highlights" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
map("n", "<leader>sb", function()
	require("telescope.builtin").live_grep({ search_dirs = { vim.api.nvim_buf_get_name(0) } })
end, { desc = "[🔭] Search current buffer" })

-- filebrowser plugin:
vim.api.nvim_set_keymap(
	"n",
	"<leader>fd",
	"<cmd>Telescope file_browser<CR>",
	{ noremap = true, desc = "Telescope file browser ", silent = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
	"n",
	"<leader>d",
	"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true, silent = true, desc = "Telescope file browser on current buffer path" }
)
