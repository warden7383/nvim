-- TODO: config toggle term
require("toggleterm").setup{
    autochdir = true,
}
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', {silent = true})
--vim.keymap.set('t', '<leader>t', ':ToggleTerm<CR>', {}) -- displays :ToggleTerm inside terminal mode
-- vim.keymap.set('t', 'jk', '<C-\\><C-n>:ToggleTerm<CR>') -- "untoggle's" :ToggleTerm and does not exit the child apparently
-- TODO: map another keybinding to exit terminal, another to get out of terminal mode
vim.keymap.set('t', 'jk', 'exit<CR>')


