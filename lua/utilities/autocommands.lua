local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

autocmd({"TextYankPost"}, {
    command = "lua vim.highlight.on_yank {timeout=700}"
})

-- For .cpp file building and compiling
-- TODO: fix a possible known autocommand error that runs on all "*??"
autocmd({"BufEnter"}, {
    pattern = {"*.cpp", "*.h"},
    callback = function()
        -- FIX: if in terminal mode, do not type g++.... when pressing leader r 
        -- map('t', '<leader>r', 'g++ -pedantic -Wall -Wextra -std=c++17 -g ')
        map('t', ';r', 'g++ -pedantic -Wall -Wextra -std=c++17 -g ', {desc = "Compile cpp in terminal mode"})
        map('n', '<leader>r', '<CMD>TermExec go_back=0 cmd="g++ -pedantic -Wall -Wextra -std=c++17 -g %"<CR>',{desc = "Compile and run"})
    end,
})

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
--also keeps the split window sizes when terminal exits
autocmd({ "VimResized" }, { --TermLeave?
  command = "lua require('bufresize').resize()",
})

-- when terminal is opened, do not alter split size of other buffers and set keymaps to quit
autocmd({"TermOpen"},{
  pattern = "term://*",
  callback = function ()
    local opt = vim.opt_local

    require("bufresize").block_register()
    require("bufresize").resize_open()
    vim.notify("entered tt")
    map({"t"}, "<C-q>", "exit<CR>", {silent = true, desc = "Quit terminal", buffer = 0}) -- buffer = 0, use in current buffer
    map({"n"}, "<C-q>", "Aexit<CR>", { desc = "Quit terminal", buffer = 0})

    opt.foldcolumn = "0"
    opt.signcolumn = "no"
    opt.number = false
    opt.relativenumber = false

    vim.cmd.startinsert()
    -- if vim.bo.filetype == "toggleterm" then
    --
    -- else
    --   vim.api.nvim_feedkeys("i", "t", false) -- start in insert mode 
    --
    -- end
  end
})

-- When terminal is closed (exited), do not allow the terminal space to move the size of the buffers in
-- the splits and return to normal mode
autocmd({"TermClose"}, {
  pattern = "term://*",
  callback = function ()
    require("bufresize").block_register()
    require("bufresize").resize_close()
    vim.notify("closed term")

    if vim.bo.filetype == "toggleterm" then
    else
      require('bufdelete').bufdelete(0, true)
      -- vim.api.nvim_feedkeys(" q", "n", false)
    end

    -- vim.cmd([[stopinsert]])
    vim.api.nvim_feedkeys("jk","t",false) --without this, closing terminals will leave you in insert mode
  end
})

