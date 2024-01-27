-- local opts = { noremap=true, silent=true }
require("bufresize").setup({
  register = {
    keys = {
    },
    trigger_events = { "BufWinEnter", "WinEnter" },
  },
  resize = {
    keys = {},
    trigger_events = { "VimResized" },
    increment = false,
  },
})
-- opts = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
-- ToggleTerm = function(direction)
--     local command = "ToggleTerm"
--     if direction == "horizontal" then
--         command = command .. " direction=horizontal"
--     elseif direction == "vertical" then
--         command = command .. " direction=vertical"
--     end
--     if vim.bo.filetype == "toggleterm" then
--         require("bufresize").block_register()
--         vim.api.nvim_command(command)
--         require("bufresize").resize_close()
--     else
--         require("bufresize").block_register()
--         vim.api.nvim_command(command)
--         require("bufresize").resize_open()
--         cmd([[execute "normal! i"]])
--     end
-- end
-- -- map("n", "<C-s>", ":lua ToggleTerm()<cr>", opts)
-- -- map("n", "<leader>ot", [[:lua ToggleTerm("horizontal")<cr>]], opts)
-- -- map("n", "<leader>ol", [[:lua ToggleTerm("vertical")<cr>]], opts)
-- -- map("i", "<C-s>", "<esc>:lua ToggleTerm()<cr>", opts)
-- -- map("t", "<C-s>", "<C-\\><C-n>:lua ToggleTerm()<cr>", opts)
--
--------For closing windows
-- map(
-- 	"t",
-- 	"<leader>wd",
-- 	"<C-\\><C-n>"
-- 		.. ":lua require('bufresize').block_register()<cr>"
-- 		.. "<C-w>c"
-- 		.. ":lua require('bufresize').resize_close()<cr>",
-- 	opt
-- 	s
-- )
-- map(
-- 	"n",
-- 	"<leader>wd",
-- 	":lua require('bufresize').block_register()<cr>" .. "<C-w>c" .. ":lua require('bufresize').resize_close()<cr>",
-- 	opts
-- )
