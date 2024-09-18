local catppuccin = require("utilities.catppuccinLualine")

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

-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local Mode = {}

-- stylua: ignore
Mode.map = {
  -- ['n']      = 'NORMAL',
  -- ['no']     = 'O-PENDING',
  -- ['nov']    = 'O-PENDING',
  -- ['noV']    = 'O-PENDING',
  -- ['no\22'] = 'O-PENDING',
  -- ['niI']    = 'NORMAL',
  -- ['niR']    = 'NORMAL',
  -- ['niV']    = 'NORMAL',
  -- ['nt']     = 'NORMAL',
  -- ['ntT']    = 'NORMAL',
  -- ['v']      = 'VISUAL',
  -- ['vs']     = 'VISUAL',
  -- ['V']      = 'V-LINE',
  -- ['Vs']     = 'V-LINE',
  -- ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  -- ['s']      = 'SELECT',
  -- ['S']      = 'S-LINE',
  -- ['\19']   = 'S-BLOCK',
  -- ['i']      = 'INSERT',
  -- ['ic']     = 'INSERT',
  -- ['ix']     = 'INSERT',
  -- ['R']      = 'REPLACE',
  -- ['Rc']     = 'REPLACE',
  -- ['Rx']     = 'REPLACE',
  -- ['Rv']     = 'V-REPLACE',
  -- ['Rvc']    = 'V-REPLACE',
  -- ['Rvx']    = 'V-REPLACE',
  -- ['c']      = 'COMMAND',
  -- ['cv']     = 'EX',
  -- ['ce']     = 'EX',
  -- ['r']      = 'REPLACE',
  -- ['rm']     = 'MORE',
  -- ['r?']     = 'CONFIRM',
  -- ['!']      = 'SHELL',
  -- ['t']      = 'TERMINAL',
}

---@return string current mode name
function Mode.get_mode()
  local mode_code = vim.api.nvim_get_mode().mode
  if Mode.map[mode_code] == nil then
    print("TRUE NIL")
    return mode_code
  end
  print("MODE: " .. mode_code)
  return Mode.map[mode_code]
end

function matchMode()
  
  if Mode.get_mode() == "^V" then
    print("matched ^V")
  else
  end
end



function filetype()
	if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
		print("TRUE ")
	else
		print("FALSE ")
	end
	print(vim.bo.filetype)
end

local function lspStatus()
	local lspName = vim.lsp.get_clients({ bufnr = 0 })
	local name = ""
	local icon = " "

	if lspName[1] == nil then
		name = icon .. "No Active LSP"
	else
		name = icon .. lspName[1].name
	end

	return name
end

-- For markdown or txt files to get wordcount (maybe get the characters too next?)
-- TODO: get characters as well and put into lualine for .md an .txt files?
function wordCount()
	local x = vim.fn.wordcount()
	print(x.words)
end

-- TODO: try to perform a check on the mode that returns "^V" whjen pressing CTRL-Q or CTRL-V to go into
-- visual block mode
local function wordStats()
	local mode = vim.api.nvim_get_mode().mode

	if mode == "v" or mode == "vs" or mode == "V" or mode == "Vs" then
		print("TRUE")
	end
	local words = vim.fn.wordcount().words
	local chars = vim.fn.wordcount().chars

	-- return "󰦨 " .. words .. " 󰀫 " .. chars -- 󰦨   󰀬 󰀫
	return words .. " words " .. chars .. " chars"
end

local function textStats()
	return wordStats()
end

local function leftMode()
	return ""
end

local function fileModified()
	if vim.bo.modified then
		return " "
	else
		return "  "
	end
end

local statusline = require("arrow.statusline")
-- statusline.is_on_arrow_file() -- return nil if current file is not on arrow.  Return the index if it is.
-- statusline.text_for_statusline() -- return the text to be shown in the statusline (the index if is on arrow or "" if not)
-- statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;D

local function arrow()
	return statusline.text_for_statusline_with_icons()
end

local function filename()
	local statusline = require("arrow.statusline")

	return {
		{
			"filename",
			file_status = true,
			symbols = {
				modified = "",
				readonly = "[RO]",
				unnamed = "[No Name]",
				newfile = "[New]",
			},
			separator = "",
			padding = { left = 1, right = 0 },
		},
		{
			fileModified,
			-- cond = function()
			-- 	if vim.bo.modified then
			-- 		return true
			-- 	else
			-- 		return false
			-- 	end
			-- end,
			color = { fg = "#9ece6a" },
			padding = 0,
		},
		{
			arrow,
			color = { fg = colors.mauve, bg = colors.surface0, gui = "bold" },
		},
	}
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		theme = catppuccin,
		-- component_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true, -- false
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			-- {
			-- 	leftMode,
			-- 	separator = "",
			-- 	padding = 0,
			-- },
			{
				"mode",
				-- separator = { left = "[[]]", right = "[[]]" },
				separator = { left = "", right = "" },
			},
		},

		-- lualine_b = { "branch", "diff", "diagnostics" },
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = "SelfLualineDiffAdd",
					modified = "SelfLualineDiffModified",
					removed = "SelfLualineDiffRemoved",
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				source = diff_source,
			},
			{
				"diagnostics",
				diagnostics_color = {
					error = "SelfLualineDiagnosticError",
					warn = "SelfLualineDiagnosticWarn",
					info = "SelfLualineDiagnosticInfo",
					hint = "SelfLualineDiagnosticHint",
				},
				symbols = {
					error = "󰅜 ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
		},
		-- lualine_c = { "filename" },
		lualine_c = filename(),
		lualine_x = {
      {
        Mode.get_mode,
      },
			{
				wordStats,
				cond = function()
					if vim.bo.filetype == "text" or vim.bo.filetype == "markdown" then
						return true
					else
						return false
					end
				end,
				color = { fg = colors.text, bg = colors.surface0, gui = "bold" },
			},
			"encoding",
			"fileformat",
			"filetype",
			lspStatus,
		},
		lualine_y = { "progress", "selectioncount" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { "filename" },
		lualine_c = filename(),
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	--   lualine_a = {
	--     "buffers",
	--   },
	--   lualine_z = {
	--     "tabs",
	--   },
	-- },
	winbar = {},
	inactive_winbar = {},
	extensions = { "fzf", "nvim-tree", "trouble", "toggleterm", "oil", "quickfix", "fugitive", "man" },
})
-- -- Bubbles config for lualine
-- -- Author: lokesh-krishna
-- -- MIT license, see LICENSE for more details.
--
--
-- -- -- Eviline config for lualine
-- -- -- Author: shadmansaleh
-- -- -- Credit: glepnir
-- -- local lualine = require('lualine')
-- --
-- -- -- Color table for highlights
-- -- -- stylua: ignore
-- -- local colors = {
-- --   bg       = '#202328',
-- --   fg       = '#bbc2cf',
-- --   yellow   = '#ECBE7B',
-- --   cyan     = '#008080',
-- --   darkblue = '#081633',
-- --   green    = '#98be65',
-- --   orange   = '#FF8800',
-- --   violet   = '#a9a1e1',
-- --   magenta  = '#c678dd',
-- --   blue     = '#51afef',
-- --   red      = '#ec5f67',
-- -- }
-- --
-- -- local conditions = {
-- --   buffer_not_empty = function()
-- --     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
-- --   end,
-- --   hide_in_width = function()
-- --     return vim.fn.winwidth(0) > 80
-- --   end,
-- --   check_git_workspace = function()
-- --     local filepath = vim.fn.expand('%:p:h')
-- --     local gitdir = vim.fn.finddir('.git', filepath .. ';')
-- --     return gitdir and #gitdir > 0 and #gitdir < #filepath
-- --   end,
-- -- }
-- --
-- -- -- Config
-- -- local config = {
-- --   options = {
-- --     -- Disable sections and component separators
-- --     component_separators = '',
-- --     section_separators = '',
-- --     theme = {
-- --       -- We are going to use lualine_c an lualine_x as left and
-- --       -- right section. Both are highlighted by c theme .  So we
-- --       -- are just setting default looks o statusline
-- --       normal = { c = { fg = colors.fg, bg = colors.bg } },
-- --       inactive = { c = { fg = colors.fg, bg = colors.bg } },
-- --     },
-- --   },
-- --   sections = {
-- --     -- these are to remove the defaults
-- --     lualine_a = {},
-- --     lualine_b = {},
-- --     lualine_y = {},
-- --     lualine_z = {},
-- --     -- These will be filled later
-- --     lualine_c = {},
-- --     lualine_x = {},
-- --   },
-- --   inactive_sections = {
-- --     -- these are to remove the defaults
-- --     lualine_a = {},
-- --     lualine_b = {},
-- --     lualine_y = {},
-- --     lualine_z = {},
-- --     lualine_c = {},
-- --     lualine_x = {},
-- --   },
-- -- }
-- --
-- -- -- Inserts a component in lualine_c at left section
-- -- local function ins_left(component)
-- --   table.insert(config.sections.lualine_c, component)
-- -- end
-- --
-- -- -- Inserts a component in lualine_x at right section
-- -- local function ins_right(component)
-- --   table.insert(config.sections.lualine_x, component)
-- -- end
-- --
-- -- ins_left {
-- --   function()
-- --     return '▊'
-- --   end,
-- --   color = { fg = colors.blue }, -- Sets highlighting of component
-- --   padding = { left = 0, right = 1 }, -- We don't need space before this
-- -- }
-- --
-- -- ins_left {
-- --   -- mode component
-- --   function()
-- --     return ''
-- --   end,
-- --   color = function()
-- --     -- auto change color according to neovims mode
-- --     local mode_color = {
-- --       n = colors.red,
-- --       i = colors.green,
-- --       v = colors.blue,
-- --       [''] = colors.blue,
-- --       V = colors.blue,
-- --       c = colors.magenta,
-- --       no = colors.red,
-- --       s = colors.orange,
-- --       S = colors.orange,
-- --       [''] = colors.orange,
-- --       ic = colors.yellow,
-- --       R = colors.violet,
-- --       Rv = colors.violet,
-- --       cv = colors.red,
-- --       ce = colors.red,
-- --       r = colors.cyan,
-- --       rm = colors.cyan,
-- --       ['r?'] = colors.cyan,
-- --       ['!'] = colors.red,
-- --       t = colors.red,
-- --     }
-- --     return { fg = mode_color[vim.fn.mode()] }
-- --   end,
-- --   padding = { right = 1 },
-- -- }
-- --
-- -- ins_left {
-- --   -- filesize component
-- --   'filesize',
-- --   cond = conditions.buffer_not_empty,
-- -- }
-- --
-- -- ins_left {
-- --   'filename',
-- --   cond = conditions.buffer_not_empty,
-- --   color = { fg = colors.magenta, gui = 'bold' },
-- -- }
-- --
-- -- ins_left { 'location' }
-- --
-- -- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
-- --
-- -- ins_left {
-- --   'diagnostics',
-- --   sources = { 'nvim_diagnostic' },
-- --   symbols = { error = ' ', warn = ' ', info = ' ' },
-- --   diagnostics_color = {
-- --     color_error = { fg = colors.red },
-- --     color_warn = { fg = colors.yellow },
-- --     color_info = { fg = colors.cyan },
-- --   },
-- -- }
-- --
-- -- -- Insert mid section. You can make any number of sections in neovim :)
-- -- -- for lualine it's any number greater then 2
-- -- ins_left {
-- --   function()
-- --     return '%='
-- --   end,
-- -- }
-- --
-- -- ins_left {
-- --   -- Lsp server name .
-- --   function()
-- --     local msg = 'No Active Lsp'
-- --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
-- --     local clients = vim.lsp.get_active_clients()
-- --     if next(clients) == nil then
-- --       return msg
-- --     end
-- --     for _, client in ipairs(clients) do
-- --       local filetypes = client.config.filetypes
-- --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- --         return client.name
-- --       end
-- --     end
-- --     return msg
-- --   end,
-- --   icon = ' LSP:',
-- --   color = { fg = '#ffffff', gui = 'bold' },
-- -- }
-- --
-- -- -- Add components to right sections
-- -- ins_right {
-- --   'o:encoding', -- option component same as &encoding in viml
-- --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- --   cond = conditions.hide_in_width,
-- --   color = { fg = colors.green, gui = 'bold' },
-- -- }
-- --
-- -- ins_right {
-- --   'fileformat',
-- --   fmt = string.upper,
-- --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
-- --   color = { fg = colors.green, gui = 'bold' },
-- -- }
-- --
-- -- ins_right {
-- --   'branch',
-- --   icon = '',
-- --   color = { fg = colors.violet, gui = 'bold' },
-- -- }
-- --
-- -- ins_right {
-- --   'diff',
-- --   -- Is it me or the symbol for modified us really weird
-- --   symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
-- --   diff_color = {
-- --     added = { fg = colors.green },
-- --     modified = { fg = colors.orange },
-- --     removed = { fg = colors.red },
-- --   },
-- --   cond = conditions.hide_in_width,
-- -- }
-- --
-- -- ins_right {
-- --   function()
-- --     return '▊'
-- --   end,
-- --   color = { fg = colors.blue },
-- --   padding = { left = 1 },
-- -- }
-- --
-- -- -- Now don't forget to initialize lualine
-- -- lualine.setup(config)
--
-- -------------------------------Default (theme='auto')-----------------------------------
-- -- local colors = {
-- --   red = '#ca1243',
-- --   grey = '#a0a1a7',
-- --   black = '#383a42',
-- --   white = '#f3f3f3',
-- --   light_green = '#83a598',
-- --   orange = '#fe8019',
-- --   green = '#8ec07c',
-- -- }
-- --
-- -- local theme = {
-- --   normal = {
-- --     a = { fg = colors.white, bg = colors.black },
-- --     b = { fg = colors.white, bg = colors.grey },
-- --     c = { fg = colors.black, bg = colors.white },
-- --     z = { fg = colors.white, bg = colors.black },
-- --   },
-- --   insert = { a = { fg = colors.black, bg = colors.light_green } },
-- --   visual = { a = { fg = colors.black, bg = colors.orange } },
-- --   replace = { a = { fg = colors.black, bg = colors.green } },
-- -- }
-- --
-- -- local empty = require('lualine.component'):extend()
-- -- function empty:draw(default_highlight)
-- --   self.status = ''
-- --   self.applied_separator = ''
-- --   self:apply_highlights(default_highlight)
-- --   self:apply_section_separators()
-- --   return self.status
-- -- end
-- --
-- -- -- Put proper separators and gaps between components in sections
-- -- local function process_sections(sections)
-- --   for name, section in pairs(sections) do
-- --     local left = name:sub(9, 10) < 'x'
-- --     for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
-- --       table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
-- --     end
-- --     for id, comp in ipairs(section) do
-- --       if type(comp) ~= 'table' then
-- --         comp = { comp }
-- --         section[id] = comp
-- --       end
-- --       comp.separator = left and { right = '' } or { left = '' }
-- --     end
-- --   end
-- --   return sections
-- -- end
-- --
-- -- local function search_result()
-- --   if vim.v.hlsearch == 0 then
-- --     return ''
-- --   end
-- --   local last_search = vim.fn.getreg('/')
-- --   if not last_search or last_search == '' then
-- --     return ''
-- --   end
-- --   local searchcount = vim.fn.searchcount { maxcount = 9999 }
-- --   return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
-- -- end
-- --
-- -- local function modified()
-- --   if vim.bo.modified then
-- --     return '+'
-- --   elseif vim.bo.modifiable == false or vim.bo.readonly == true then
-- --     return '-'
-- --   end
-- --   return ''
-- -- end
-- --
-- -- require('lualine').setup {
-- --   options = {
-- --     theme = theme,
-- --     component_separators = '',
-- --     section_separators = { left = '', right = '' },
-- --   },
-- --   sections = process_sections {
-- --     lualine_a = { 'mode' },
-- --     lualine_b = {
-- --       'branch',
-- --       'diff',
-- --       {
-- --         'diagnostics',
-- --         source = { 'nvim' },
-- --         sections = { 'error' },
-- --         diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
-- --       },
-- --       {
-- --         'diagnostics',
-- --         source = { 'nvim' },
-- --         sections = { 'warn' },
-- --         diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
-- --       },
-- --       { 'filename', file_status = false, path = 1 },
-- --       { modified, color = { bg = colors.red } },
-- --       {
-- --         '%w',
-- --         cond = function()
-- --           return vim.wo.previewwindow
-- --         end,
-- --       },
-- --       {
-- --         '%r',
-- --         cond = function()
-- --           return vim.bo.readonly
-- --         end,
-- --       },
-- --       {
-- --         '%q',
-- --         cond = function()
-- --           return vim.bo.buftype == 'quickfix'
-- --         end,
-- --       },
-- --     },
-- --     lualine_c = {},
-- --     lualine_x = {},
-- --     lualine_y = { search_result, 'filetype' },
-- --     lualine_z = { '%l:%c', '%p%%/%L' },
-- --   },
-- --   inactive_sections = {
-- --     lualine_c = { '%f %y %m' },
-- --     lualine_x = {},
-- --   },
-- -- }
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }
--
-- require('lualine').setup {
--   options = {
--     theme = bubbles_theme,
--     component_separators = '    ', -- | -- this changes the component separators on the XYZ side..
--     section_separators = { left = '', right = '' },
--   },
--   sections = {
--     lualine_a = {
--       { 'mode', separator = { left = '', right = '  ' }, right_padding = 9 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', separator = { right = '' }, left_padding = 2 },
--     },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {},
-- }

-- -- Eviline config for lualine
-- -- Author: shadmansaleh
-- -- Credit: glepnir
-- local lualine = require('lualine')
--
-- -- Color table for highlights
-- -- stylua: ignore
-- local colors = {
--   bg       = '#202328',
--   fg       = '#bbc2cf',
--   yellow   = '#ECBE7B',
--   cyan     = '#008080',
--   darkblue = '#081633',
--   green    = '#98be65',
--   orange   = '#FF8800',
--   violet   = '#a9a1e1',
--   magenta  = '#c678dd',
--   blue     = '#51afef',
--   red      = '#ec5f67',
-- }
--
-- local conditions = {
--   buffer_not_empty = function()
--     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--   end,
--   hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
--   end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand('%:p:h')
--     local gitdir = vim.fn.finddir('.git', filepath .. ';')
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }
--
-- -- Config
-- local config = {
--   options = {
--     -- Disable sections and component separators
--     component_separators = '',
--     section_separators = '',
--     theme = {
--       -- We are going to use lualine_c an lualine_x as left and
--       -- right section. Both are highlighted by c theme .  So we
--       -- are just setting default looks o statusline
--       normal = { c = { fg = colors.fg, bg = colors.bg } },
--       inactive = { c = { fg = colors.fg, bg = colors.bg } },
--     },
--   },
--   sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     -- These will be filled later
--     lualine_c = {},
--     lualine_x = {},
--   },
--   inactive_sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     lualine_c = {},
--     lualine_x = {},
--   },
-- }
--
-- -- Inserts a component in lualine_c at left section
-- local function ins_left(component)
--   table.insert(config.sections.lualine_c, component)
-- end
--
-- -- Inserts a component in lualine_x at right section
-- local function ins_right(component)
--   table.insert(config.sections.lualine_x, component)
-- end
--
-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- }
--
-- ins_left {
--   -- mode component
--   function()
--     return ''
--   end,
--   color = function()
--     -- auto change color according to neovims mode
--     local mode_color = {
--       n = colors.red,
--       i = colors.green,
--       v = colors.blue,
--       [''] = colors.blue,
--       V = colors.blue,
--       c = colors.magenta,
--       no = colors.red,
--       s = colors.orange,
--       S = colors.orange,
--       [''] = colors.orange,
--       ic = colors.yellow,
--       R = colors.violet,
--       Rv = colors.violet,
--       cv = colors.red,
--       ce = colors.red,
--       r = colors.cyan,
--       rm = colors.cyan,
--       ['r?'] = colors.cyan,
--       ['!'] = colors.red,
--       t = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }
--
-- ins_left {
--   -- filesize component
--   'filesize',
--   cond = conditions.buffer_not_empty,
-- }
--
-- ins_left {
--   'filename',
--   cond = conditions.buffer_not_empty,
--   color = { fg = colors.magenta, gui = 'bold' },
-- }
--
-- ins_left { 'location' }
--
-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
--
-- ins_left {
--   'diagnostics',
--   sources = { 'nvim_diagnostic' },
--   symbols = { error = ' ', warn = ' ', info = ' ' },
--   diagnostics_color = {
--     color_error = { fg = colors.red },
--     color_warn = { fg = colors.yellow },
--     color_info = { fg = colors.cyan },
--   },
-- }
--
-- -- Insert mid section. You can make any number of sections in neovim :)
-- -- for lualine it's any number greater then 2
-- ins_left {
--   function()
--     return '%='
--   end,
-- }
--
-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = '#ffffff', gui = 'bold' },
-- }
--
-- -- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
-- ins_right {
--   'branch',
--   icon = '',
--   color = { fg = colors.violet, gui = 'bold' },
-- }
--
-- ins_right {
--   'diff',
--   -- Is it me or the symbol for modified us really weird
--   symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
--   diff_color = {
--     added = { fg = colors.green },
--     modified = { fg = colors.orange },
--     removed = { fg = colors.red },
--   },
--   cond = conditions.hide_in_width,
-- }
--
-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue },
--   padding = { left = 1 },
-- }
--
-- -- Now don't forget to initialize lualine
-- lualine.setup(config)

-------------------------------Default (theme='auto')-----------------------------------
-- local colors = {
--   red = '#ca1243',
--   grey = '#a0a1a7',
--   black = '#383a42',
--   white = '#f3f3f3',
--   light_green = '#83a598',
--   orange = '#fe8019',
--   green = '#8ec07c',
-- }
--
-- local theme = {
--   normal = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.white },
--     z = { fg = colors.white, bg = colors.black },
--   },
--   insert = { a = { fg = colors.black, bg = colors.light_green } },
--   visual = { a = { fg = colors.black, bg = colors.orange } },
--   replace = { a = { fg = colors.black, bg = colors.green } },
-- }
--
-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end
--
-- -- Put proper separators and gaps between components in sections
-- local function process_sections(sections)
--   for name, section in pairs(sections) do
--     local left = name:sub(9, 10) < 'x'
--     for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
--       table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
--     end
--     for id, comp in ipairs(section) do
--       if type(comp) ~= 'table' then
--         comp = { comp }
--         section[id] = comp
--       end
--       comp.separator = left and { right = '' } or { left = '' }
--     end
--   end
--   return sections
-- end
--
-- local function search_result()
--   if vim.v.hlsearch == 0 then
--     return ''
--   end
--   local last_search = vim.fn.getreg('/')
--   if not last_search or last_search == '' then
--     return ''
--   end
--   local searchcount = vim.fn.searchcount { maxcount = 9999 }
--   return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
-- end
--
-- local function modified()
--   if vim.bo.modified then
--     return '+'
--   elseif vim.bo.modifiable == false or vim.bo.readonly == true then
--     return '-'
--   end
--   return ''
-- end
--
-- require('lualine').setup {
--   options = {
--     theme = theme,
--     component_separators = '',
--     section_separators = { left = '', right = '' },
--   },
--   sections = process_sections {
--     lualine_a = { 'mode' },
--     lualine_b = {
--       'branch',
--       'diff',
--       {
--         'diagnostics',
--         source = { 'nvim' },
--         sections = { 'error' },
--         diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
--       },
--       {
--         'diagnostics',
--         source = { 'nvim' },
--         sections = { 'warn' },
--         diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--       },
--       { 'filename', file_status = false, path = 1 },
--       { modified, color = { bg = colors.red } },
--       {
--         '%w',
--         cond = function()
--           return vim.wo.previewwindow
--         end,
--       },
--       {
--         '%r',
--         cond = function()
--           return vim.bo.readonly
--         end,
--       },
--       {
--         '%q',
--         cond = function()
--           return vim.bo.buftype == 'quickfix'
--         end,
--       },
--     },
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = { search_result, 'filetype' },
--     lualine_z = { '%l:%c', '%p%%/%L' },
--   },
--   inactive_sections = {
--     lualine_c = { '%f %y %m' },
--     lualine_x = {},
--   },
-- }
