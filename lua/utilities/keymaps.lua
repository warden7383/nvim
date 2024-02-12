vim.g.mapleader = " "
local map = vim.keymap.set

----very necessary
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'Jk', '<esc>')
vim.keymap.set('i', 'JK', '<esc>')
vim.keymap.set('i', 'jK', '<esc>')
vim.keymap.set('c', 'jk', '<C-c>')

-- better up and down movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

--Center scrolling (neoscroll override)
-- map("n", "<C-u>", "<C-u>zz", {})
-- map("n", "<C-d>", "<C-d>zz", {})
-- map("n", "<C-b>", "<C-b>zz", {})
-- map("n", "<C-f>", "<C-f>zz", {})

map('n', '<leader>c', function ()
  require("notify").dismiss()
  vim.cmd('nohlsearch')
end, {silent = true, desc = "Clear highlight search and dismiss Notify Notifications"})

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

--Tab mappings
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>b", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

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
map("n", "<M-d>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-u>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("i", "<M-d>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<M-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set({'v'}, '<M-u>', ":move'<-2<cr>gv=gv", {silent = true, desc = "Move a group of lines up"}) -- <SPACE>k
vim.keymap.set({'v'}, '<M-d>', ":move'>+1<cr>gv=gv", {silent = true, desc = "Move a group of lines down"}) -- <SPACE>j

--------------------Plugin specific Keymaps---------------------------
-- vim.keymap.set("n", "<C-s>", [[<cmd>%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left><cr>]], {silent = true, desc = "Subsitute words"})
vim.keymap.set( "n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
vim.keymap.set("v", "<C-s>", [[:%s/\%V\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

-- Split paragraphs into sentences
vim.keymap.set("n", "<M-s>", "<CMD>s/\\. /.\\r/e<CR><CMD>nohlsearch<CR>")

