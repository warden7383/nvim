vim.g.mapleader = " "
local map = vim.keymap

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<leader>c', ':nohlsearch<CR>', {silent = true} )
-- vim.keymap.set('n', '<leader>v', vim.api.nvim_paste())
-- vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', {silent = true}) -- from vim-bbye plugin NOTE this keymap is set on lazyPlugins.lua
-- vim.keymap.set('n', 'DD', ':TroubleToggle document_diagnostics<CR>', {silent = true}) -- enable when trouble.nvim exists
vim.keymap.set('c', 'jk', '<C-c>')
vim.keymap.set('n', '<leader>b', '<CMD>enew<CR>', {silent = true}, {desc = "New file"})

-----------------------Navigation Keymaps---------------------
--Buffer navigation
vim.keymap.set('n', '<M-b>', '<CMD>bp<CR>', {silent = true}, {desc = "Move to previous buffer"})
vim.keymap.set('n', '<M-n>', '<CMD>bn<CR>', {silent = true}, {desc = "Move to next buffer"})
--Resize windows
vim.keymap.set('n', '<Right>', '<C-w>>', {desc = "Enlarges window width"})
vim.keymap.set('n', '<Left>', '<C-w><lt>', {desc = "Shrinks window width"})
vim.keymap.set('n', '<Down>', '<C-w>+', {desc = "increase window height"})
vim.keymap.set('n', '<Up>', '<C-w>-', {desc = "decrease window height"})
--Naviate through windows
vim.keymap.set({'n','t'}, '<C-h>', '<C-w>h', {desc = "Moves cursor to the right window"})
vim.keymap.set({'n','t'}, '<C-l>', '<C-w>l', {desc = "Moves cursor to the left window"})
vim.keymap.set({'n','t'}, '<C-k>', '<C-w>k', {desc = "Moves cursor to the top window"})
vim.keymap.set({'n','t'}, '<C-j>', '<C-w>j', {desc = "Moves cursor to the bottom window"})
--Code line alteration
--Possible mappings: <C-d> <C-u>
vim.keymap.set('n', '<M-d>', '<cmd>move+<CR>==', {desc = "Move a line down"}) --fix these later
vim.keymap.set('n', '<M-u>', '<cmd>move-2<CR>==', {desc = "Move a line up"}) --fix these later
vim.keymap.set({'v'}, '<M-u>', ":move'<-2<cr>gv=gv", {silent = true}, {desc = "Move a group of lines up"}) -- <SPACE>k
vim.keymap.set({'v'}, '<M-d>', ":move'>+1<cr>gv=gv", {silent = true}, {desc = "Move a group of lines down"}) -- <SPACE>j

--------------------Plugin specific Keymaps---------------------------
--vim.keymap.set('n', '<leader>d', ':NvimTreeFindFileToggle<CR>', {silent = true})

--------Telescope-------
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


