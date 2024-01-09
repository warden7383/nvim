require('illuminate').configure({
  under_cursor = true,
  min_count_to_highlight = 2,
  filetypes_denylist = {
    'alpha',
    'nvimtree',
    -- 'fugitive',
  },
})

--TODO: fix this damn fucking thing so it can switch from selection bar illuminate to underline illuminate
--
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", {})
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {gui=underline})
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", {gui=underline})
-- local illumgroup = vim.api.nvim_create_augroup("illuminate_augroup",{clear=true})
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({"VimEnter"}, {
--   group = illumgroup,
--   pattern = "*.",
--   -- callback = function()
--   --   vim.cmd([[
--   --   :hi link illuminatedWord CursorLine
--   --   ]])
--   -- end,
--   command = "hi link illuminatedWord CursorLine",
-- })
--
-- autocmd({"VimEnter"},{
--   group = illumgroup,
--   pattern = "*.",
--   -- callback = function()
--   --   vim.cmd([[
--   --   :hi link illuminatedWord CursorLine
--   --   ]])
--   -- end,
--   command = "hi illuminatedWord cterm=underline gui=underline"
-- })
--
