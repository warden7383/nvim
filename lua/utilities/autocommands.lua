-- briefly display the selected text that was yanked
local autocmd = vim.api.nvim_create_autocmd

autocmd({"TextYankPost"}, {
    command = "lua vim.highlight.on_yank {timeout=1000}"
})

--NOTE: Does not work
--from defaults.vim in vim (PATH: vim/runetime/defaults.vim)
--
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
-- autocmd('BufReadPost', {
--   callback = function(args)
--     local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
--     local not_commit = vim.b[args.buf].filetype ~= 'commit'
--
--     if valid_line and not_commit then
--       vim.cmd([[normal! g`"]])
--     end
--   end,
-- })

-- get the last pos of cursor
-- NOTE: seems to only when file is saved and buffer is deleted 
-- calling ':qa' does not seem to save the last pos?

-- vim.api.nvim_create_autocmd({'BufWinEnter'}, {
--   desc = 'return cursor to where it was last time closing the file',
--   pattern = '*',
--   command = 'silent! normal! g`"zv',
-- })
