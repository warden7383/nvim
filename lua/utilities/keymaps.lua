vim.g.mapleader = " "
local map = vim.keymap.set

----very necessary
map("i", "jk", "<esc>")
map("i", "Jk", "<esc>")
map("i", "JK", "<esc>")
map("i", "jK", "<esc>")
map("c", "jk", "<C-c>")

-- better up and down movement (deals with word wrap)
map({ "n", "v", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "v", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Stay in visual mode, indent left", silent = true })
map("v", ">", ">gv", { desc = "Stay in visual mode, indent right", silent = true })
-- keep cursor position when joining 2 lines of code
map("n", "J", "mzJ`z:delmarks z<cr>", { desc = "keep cursor position when joining code", silent = true })

--Center scrolling (neoscroll override)
map("n", "<C-u>", "<C-u>zz", { desc = "Center scroll up" })
-- map("n", "<C-u>", "<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>", {}) -- smooth scrolling. (see tips.txt)
map("n", "<C-d>", "<C-d>zz", { desc = "Center scroll down" })
-- map("n", "<C-d>", "<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>", {})
map("n", "<C-b>", "<C-b>zz", {})
map("n", "<C-f>", "<C-f>zz", {})

map("n", "<leader>c", function()
	require("notify").dismiss()
	vim.cmd("nohlsearch")
end, { silent = true, desc = "Clear highlight search and dismiss Notify Notifications" })

map("n", "<leader>b", "<CMD>enew<CR>", { silent = true, desc = "New file" })
map("n", "x", '"_x')
map({ "n", "v" }, "c", '"_c')
map("n", "C", '"_C')
map("n", "S", '"_S')
map("n", "d", '"_d')

--Buffer navigation
map("n", "<M-b>", "<CMD>bp<CR>", { silent = true, desc = "Move to previous buffer" })
map("n", "<M-n>", "<CMD>bn<CR>", { silent = true, desc = "Move to next buffer" })
--- NOTE: the following code here is being used in smart-splits.lua

--Tab mappings
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>b", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

--Resize windows
map("n", "<Right>", "<C-w>>", { desc = "Enlarges window width" })
map("n", "<Left>", "<C-w><lt>", { desc = "Shrinks window width" })
map("n", "<Down>", "<C-w>+", { desc = "increase window height" })
map("n", "<Up>", "<C-w>-", { desc = "decrease window height" })

map("n", "<leader>sv", "<CMD>vsplit<CR>", { silent = true, desc = "Split Vertical" })
map("n", "<leader>sh", "<CMD>split<CR>", { silent = true, desc = "Split Horizontal" })

--Naviate through windows
-- map({'n','t'}, '<C-h>', '<C-w>h', {desc = "Moves cursor to the right window"})
-- map({'n','t'}, '<C-l>', '<C-w>l', {desc = "Moves cursor to the left window"})
-- map({'n','t'}, '<C-k>', '<C-w>k', {desc = "Moves cursor to the top window"})
-- map({'n','t'}, '<C-j>', '<C-w>j', {desc = "Moves cursor to the bottom window"})

--Code line alteration
map("n", "<M-d>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-u>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("i", "<M-d>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<M-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map({ "v" }, "<M-u>", ":move'<-2<cr>gv=gv", { silent = true, desc = "Move a group of lines up" })
map({ "v" }, "<M-d>", ":move'>+1<cr>gv=gv", { silent = true, desc = "Move a group of lines down" })

--Word subsitution
map(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
	{ desc = "Replace word on cursor" }
)
map("v", "<leader>sr", function()
	vim.ui.input({ prompt = "Enter search string:" }, function(input)
		if input ~= nil then
			vim.api.nvim_feedkeys(":'<,'>s/" .. input .. "/" .. input .. "/gIc", "!", false)
			vim.cmd([[
      call feedkeys("\<Left>\<Left>\<Left>\<Left>")
      ]])
		end
	end)
end, { desc = "Replace selected words in visual mode" })

-- Split paragraphs into sentences
map("n", "<leader>sp", "<CMD>s/\\. /.\\r/e<CR><CMD>nohlsearch<CR>")

-- Toggle relative numbers off or on (for code presentation)
map({ "n", "v" }, "<leader>tn", "<cmd>set rnu!<cr>", {})

--insert the following characters around the visual selection
map("v", "<leader>(", "s()<esc>Pll", { desc = "wrap selection with parens" })
map("v", "<leader>[", "s[]<esc>Pll", { desc = "wrap selection with square braces" })
map("v", "<leader>{", "s{}<esc>Pll", { desc = "wrap selection with curly braces" })
map("v", "<leader>'", "s''<esc>Pll", { desc = "wrap selection with single quotes" })
map("v", '<leader>"', 's""<esc>Pll', { desc = "wrap selection with double quotes" })
