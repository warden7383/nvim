--Temp file
--------------------Plugin specific Keymaps---------------------------
vim.keymap.set('n', '<leader>d', ':NvimTreeFindFileToggle<CR>', {silent = true})

--------Telescope-------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find Buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find Help"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "Find Old Files"})

------Trouble -----
-- vim.keymap.set('n', 'DD', ':TroubleToggle document_diagnostics<CR>', {silent = true}) -- enable when trouble.nvim exists
