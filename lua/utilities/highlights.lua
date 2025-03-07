local colors = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	subtext1 = "#b8c0e0",
	subtext0 = "#a5adcb",
	overlay2 = "#939ab7",
	overlay1 = "#8087a2",
	overlay0 = "#6e738d",
	surface2 = "#5b6078",
	surface1 = "#494d64",
	surface0 = "#363a4f",
	base = "#24273a",
	mantle = "#1e2030",
	crust = "#24283b",
	-- The colors below are not part of catppuccin's palette
	transparent_bg = "NONE", -- #1e2030
	black = "#16161e",
	text1 = "#a9b1d6",
}

-- #macchiato colorscheme
-- rosewater: &rosewater "#f4dbd6"
-- flamingo: &flamingo "#f0c6c6"
-- pink: &pink "#f5bde6"
-- mauve: &mauve "#c6a0f6"
-- red: &red "#ed8796"
-- maroon: &maroon "#ee99a0"
-- peach: &peach "#f5a97f"
-- yellow: &yellow "#eed49f"
-- green: &green "#a6da95"
-- teal: &teal "#8bd5ca"
-- sky: &sky "#91d7e3"
-- sapphire: &sapphire "#7dc4e4"
-- blue: &blue "#8aadf4"
-- lavender: &lavender "#b7bdf8"
-- text: &text "#cad3f5"
-- subtext1: &subtext1 "#b8c0e0"
-- subtext0: &subtext0 "#a5adcb"
-- overlay2: &overlay2 "#939ab7"
-- overlay1: &overlay1 "#8087a2"
-- overlay0: &overlay0 "#6e738d"
-- surface2: &surface2 "#5b6078"
-- surface1: &surface1 "#494d64"
-- surface0: &surface0 "#363a4f"
-- base: &base "#24273a"
-- mantle: &mantle "#1e2030"
-- crust: &crust "#24283b" #181926"

local api = vim.api.nvim_set_hl

--line column
api(0, "LineNrAbove", { fg = "#8087a2", bold = true })
api(0, "LineNr", { fg = "#8087a2", bold = true })
api(0, "CursorLineNr", { fg = "#c6a0f6", bold = true }) -- #eed49f
api(0, "LineNrBelow", { fg = "#8087a2", bold = true }) --#FB508F #80bd9c #68ded8 #f5d3ba
api(0, "WinSeparator", { fg = "#8aadf4", bold = true }) --#FB508F #80bd9c #68ded8 #f5d3ba
api(0, "SignColumn", { fg = "#8aadf4", bold = true })
api(0, "ColorColumn", { link = "CursorColumn" })

api(0, "TabLineFill", { bg = colors.transparent_bg }) -- tabline background

api(0, "FloatBorder", { fg = "#363a4f" })

-- remove background from diagnostic virtual messages and set italic
api(0, "DiagnosticVirtualTextInfo", { bg = "NONE", fg = "#0db9d7", italic = true })
api(0, "DiagnosticVirtualTextWarn", { bg = "NONE", fg = "#e0af68", italic = true })
api(0, "DiagnosticVirtualTextHint", { bg = "NONE", fg = "#1abc9c", italic = true })
api(0, "DiagnosticVirtualTextError", { bg = "NONE", fg = "#db4b4b", italic = true }) -- #ed8796  #db4b4b (default)

-- Indent blankline
api(0, "IblScope", { fg = "#c6a0f6" })

api(0, "TelescopePromptBorder", { link = "TelescopeBorder" })
api(0, "TelescopeBorder", { fg = colors.black, bg = colors.black }) -- #80b7ff -- #363a4f
api(0, "TelescopePromptTitle", { bg = "#8bd5ca", fg = "#1e2030", bold = true })
api(0, "TelescopeResultsTitle", { bg = "#7dc4e4", fg = "#1e2030", bold = true })
api(0, "TelescopeResultsBorder", { fg = "#363a4f", bg = colors.black, bold = true })
api(0, "TelescopePreviewTitle", { bg = "#ee99a0", fg = "#1e2030", bold = true })
api(0, "TelescopePreviewBorder", { fg = "#363a4f", bg = colors.black, bold = true })
api(0, "TelescopeSelectionCaret", { fg = colors.mauve, bg = "#363a4f", bold = true })
api(0, "TelescopePromptCounter", { fg = "#b7bdf8", bold = true })
api(0, "TelescopeSelection", { bg = "#363a4f" })

api(0, "IncSearch", { bg = "#f5a97f", fg = "#24273a" })
api(0, "Search", { bg = "#b5a5fa", fg = "#24273a" })
------------------------------CMP Highlights ---------------------------------------------------------
-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#8bd5ca", fg = "#1e2030", bold = true }) --DEFAULT: bg = "#282C34", fg = "NONE" #29a4bd

-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
--
-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
--
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

-------------------------Notify Highlights ------------------------------------------------------
vim.cmd([[
highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
]])

api(0, "WinBar", { bg = "NONE", fg = "#a9b1d6" }) -- used for dropbar.nvim
api(0, "WinBarNC", { bg = "NONE", fg = "#3b4261" }) -- used for dropbar.nvim

--------------------Illuminate------------------------------
vim.cmd([[hi illuminatedWord gui=underline guibg=NONE]])
vim.cmd([[hi illuminatedWordWrite gui=underline guibg=NONE]])
vim.cmd([[hi illuminatedWordText gui=underline guibg=NONE]])
vim.cmd([[hi illuminatedWordRead gui=underline guibg=NONE]])
vim.cmd([[hi illuminatedCurWord gui=underline guibg=NONE]])

-- api(0, 'DiffAdd', {bg="#8bd5ca"})
-- api(0, 'DiffText', bg=)
-- api(0, 'DiffChange', bg=)
-- api(0, 'DiffDelete', bg=)

--overwritten by terminal cursor settings first
api(0, "CursorIM", { fg = "#24283b", bg = "#c6a0f6" })
api(0, "Cursor", { fg = "#24283b", bg = "#c6a0f6" })
api(0, "lCursor", { fg = "#24283b", bg = "#c6a0f6" })
api(0, "TermCursor", { fg = "#24283b", bg = "#c6a0f6" })

api(0, "ScrollViewCursor", { fg = "#c6a0f6", bg = "#c6a0f6" })

----Alpha (landing page)
api(0, "AlphaHeader", { fg = "#5eb9ff" }) -- #7dc4e4 #5eb9ff
api(0, "AlphaButtons", { fg = "#8bd5ca", bg = "" })
api(0, "AlphaShortcut", { fg = "#ed8796", bg = "" })
api(0, "AlphaFooter", { fg = "#c6a0f6", bg = "" })

-----Incline
api(0, "InclineNormal", { fg = "#181926", bg = "#c6a0f6" })
api(0, "InclineNormalNC", { fg = "#363a4f", bg = "#8aadf4" })

----Flash.nvim
api(0, "FlashLabel", { bg = "#ed8796", fg = "#181926", italic = true }) --#ee99a0 #f5bde6 #ed8796 #f4dbd6
api(0, "FlashMatch", { bg = "#cad3f5", fg = "#181926" }) --#ee99a0 #f5bde6 #ed8796

----Bufferline.nvim (highlights duplicate buffers that have the same filename but the path is different)
-- api(0, "BufferLineDuplicateSelected", { bg = "#24273a", fg = "#cad3f5" })
api(0, "BufferLineDuplicateSelected", { link = "BufferLineBufferSelected" })

----Lualine highlights + custom highlights
api(0, "SelfLualineDiagnosticError", { fg = "#ed8796", bg = "#16161e" })
api(0, "SelfLualineDiagnosticWarn", { fg = "#eed49f", bg = "#16161e" })
api(0, "SelfLualineDiagnosticInfo", { fg = "#8aadf4", bg = "#16161e" })
api(0, "SelfLualineDiagnosticHint", { fg = "#8bd5ca", bg = "#16161e" })

api(0, "SelfLualineDiffAdd", { fg = "#a6da95", bg = "#16161e", bold = true })
api(0, "SelfLualineDiffModified", { fg = "#8aadf4", bg = "#16161e", bold = true })
api(0, "SelfLualineDiffRemoved", { fg = "#ed8796", bg = "#16161e", bold = true })

-- noice cmdline
api(0, "NoiceCmdlinePopupTitle", { fg = colors.black, bg = colors.black })
api(0, "NoiceCmdlinePopup", { bg = colors.mantle })
api(0, "NoiceCmdlinePopupBorder", { fg = colors.mantle, bg = colors.mantle })
api(0, "NoiceCmdlineIcon", { fg = colors.mauve })
