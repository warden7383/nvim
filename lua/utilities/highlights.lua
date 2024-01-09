local api = vim.api

--line column
api.nvim_set_hl(0, 'LineNrAbove', { fg='#f5d3ba', bold=true })
api.nvim_set_hl(0, 'CursorLineNr', { fg='#f5d3ba', bold=true })
api.nvim_set_hl(0, 'LineNrBelow', { fg='#f5d3ba', bold=true }) --#FB508F #80bd9c #68ded8

-- vim.cmd([[
--
-- " -----------------HIGHLIGHTS--------------------
-- " :hi Comment guifg=#777c96 
-- " :hi TelescopeBorder guifg=#80b7ff "enable this after installing telescope
--
-- " these highligt options below don't seem to change the wildermenu's background color
-- " :hi FloatShadow guibg=White blend=0
-- " :hi FloatShadowThrough guibg=White blend=0
-- " :hi NoiceAttr11 guibg=white blend=0
-- " :hi NoiceAttr12 guibg=white blend=0
-- " :hi NoiceAttr316 guifg=white
-- " :hi NoiceAttr1060 guifg=white
-- " :hi DevIconScheme ctermfg=16 guifg=white
-- " ---------------CURSOR HIGHLIGHTING----------------
-- " :hi Cursor guifg=#1e1d24 guibg=#FF7DA3 " only highlights the cursor in command mode
-- ]])
--
