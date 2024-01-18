local telescope = require("telescope")
telescope.setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},

    persisted = {
      layout_config = {
        width = 0.55, 
        height = 0.55
      }
    },
	}

}
-- }require("telescope").setup {
-- 	extensions = {
-- 		fzf = {
-- 			fuzzy = true,
-- 			override_generic_sorter = true,
-- 			override_file_sorter = true,
-- 			case_mode = "smart_case",
-- 		}
-- 	}
-- }

telescope.load_extension('fzf')
require("telescope").load_extension("notify")
-- require("telescope").load_extension("persisted")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find Help"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "Find Old Files"})

