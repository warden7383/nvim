local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

autocmd({"TextYankPost"}, {
    command = "lua vim.highlight.on_yank {timeout=700}"
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

-- For .cpp file building and compiling
-- TODO: fix a possible known autocommand error that runs on all "*??"
autocmd({"BufEnter"}, {
    pattern = {"*.cpp", "*.h", "*.lua"},
    -- command = "echo 'Enter j lua file'",
    callback = function()
        -- print("Entered into lua file")
        -- vim.keymap.set('n', '<leader>r', function()
        --     print("This is actually working")
        -- end)
        -- vim.keymap.set('n', '<leader>r', '<CMD>ToggleTerm dir=vim.fn.getcwd()<CR>')
        -- vim.keymap.set('n', '<leader>rr', function()
        --     vim.cmd([[
        --         " ToggleTerm
        --         TermExec cmd="echo" dir=vim.fn.getcwd()
        --     ]])
        -- end)
        map('t', '<leader>r', 'g++ -pedantic -Wall -Wextra -std=c++17 -g ')
        map('n', '<leader>r', '<CMD>TermExec go_back=0 cmd="g++ -pedantic -Wall -Wextra -std=c++17 -g %"<CR>')
    end,
})
-- TODO: figure out what this did again.....

autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
    command = "setlocal cursorline"
})
autocmd({"WinLeave"}, {
    command = "setlocal nocursorline"
})

autocmd("User", {
  pattern = "AlphaReady",
  command = "set laststatus=0"
})

--resize windows when Vim's window size changes
autocmd("VimResized", {
  command = "wincmd="
})
-- Sets statusline to global state
-- autocmd({"BufEnter", "VimEnter", "WinEnter"},{
--   once = true,
--   -- command = "set laststatus=3",
--   callback = function()
--     vim.notify("setting status to global",3)
--     vim.cmd([[
--       set laststatus=3
--     ]])
--   end,
-- })
