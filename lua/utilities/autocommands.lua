-- briefly display the selected text that was yanked
local autocmd = vim.api.nvim_create_autocmd

autocmd({"TextYankPost"}, {
    command = "lua vim.highlight.on_yank {timeout=1000}"
})
