vim.g.mapleader = " "
local map = vim.keymap.set

----very necessary
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'Jk', '<esc>')
vim.keymap.set('i', 'JK', '<esc>')
vim.keymap.set('i', 'jK', '<esc>')
vim.keymap.set('c', 'jk', '<C-c>')

map('n', '<leader>c', function ()
  require("notify").dismiss()
  vim.cmd('nohlsearch')
end, {silent = true, desc = "Clear highlight search and dismiss Notify Notifications"})

-- vim.keymap.set('n', '<leader>v', vim.api.nvim_paste())
vim.keymap.set('n', '<leader>b', '<CMD>enew<CR>', {silent = true, desc = "New file"} )
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
vim.keymap.set('n', 'S', '"_S')
vim.keymap.set('n', 'd', '"_d') -- TEST:

--Buffer navigation
vim.keymap.set('n', '<M-b>', '<CMD>bp<CR>', {silent = true, desc = "Move to previous buffer"})
vim.keymap.set('n', '<M-n>', '<CMD>bn<CR>', {silent = true, desc = "Move to next buffer"})
--- NOTE: the following code here is being used in smart-splits.lua

--Resize windows
vim.keymap.set('n', '<Right>', '<C-w>>', {desc = "Enlarges window width"})
vim.keymap.set('n', '<Left>', '<C-w><lt>', {desc = "Shrinks window width"})
vim.keymap.set('n', '<Down>', '<C-w>+', {desc = "increase window height"})
vim.keymap.set('n', '<Up>', '<C-w>-', {desc = "decrease window height"})

map('n','<leader>sv', '<CMD>vsplit<CR>', {silent = true, desc = "Split Vertical"})
map('n','<leader>sh', '<CMD>split<CR>', {silent = true, desc = "Split Horizontal"})
--Naviate through windows
-- vim.keymap.set({'n','t'}, '<C-h>', '<C-w>h', {desc = "Moves cursor to the right window"})
-- vim.keymap.set({'n','t'}, '<C-l>', '<C-w>l', {desc = "Moves cursor to the left window"})
-- vim.keymap.set({'n','t'}, '<C-k>', '<C-w>k', {desc = "Moves cursor to the top window"})
-- vim.keymap.set({'n','t'}, '<C-j>', '<C-w>j', {desc = "Moves cursor to the bottom window"})

--Code line alteration
--Possible mappings: <C-d> <C-u>
vim.keymap.set('n', '<M-d>', '<cmd>move+<CR>==', {desc = "Move a line down"}) --fix these later
vim.keymap.set('n', '<M-u>', '<cmd>move-2<CR>==', {desc = "Move a line up"}) --fix these later
vim.keymap.set({'v'}, '<M-u>', ":move'<-2<cr>gv=gv", {silent = true, desc = "Move a group of lines up"}) -- <SPACE>k
vim.keymap.set({'v'}, '<M-d>', ":move'>+1<cr>gv=gv", {silent = true, desc = "Move a group of lines down"}) -- <SPACE>j

--------------------Plugin specific Keymaps---------------------------
--vim.keymap.set('n', '<leader>d', ':NvimTreeFindFileToggle<CR>', {silent = true})

