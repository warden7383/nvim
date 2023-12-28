--Temp file
--------------------Plugin specific Keymaps---------------------------
vim.keymap.set('n', '<leader>d', ':NvimTreeFindFileToggle<CR>', {silent = true})

--------Telescope-------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


------Trouble -----
-- vim.keymap.set('n', 'DD', ':TroubleToggle document_diagnostics<CR>', {silent = true}) -- enable when trouble.nvim exists
