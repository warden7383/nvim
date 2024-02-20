local opt = vim.opt
local api = vim.api
local glb = vim.g

local sign = vim.diagnostic.severity

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
-- vim-waka api key: if you get a new key, find your wakatime.cfg file and replace the api key if the 
-- WakaTimeAPI.... throws 104 incorrect api key. (very likely the .cfg file is appending the api key instead of)
-- replacing it
-- windows 10/11 .wakatime.cfg file location: ~/wakatime.cfg (aka, C:\Users\YOUR_USERNAME\.wakatime.cfg) (see example below)
-- example: "C:\Users\Andrew Ng\.wakatime.cfg"

--ENABLE WHEN nvim-tree IS INSTALLED
glb.loaded_netrw = 1 -- for nvim-tree
glb.loaded_netrwPlugin = 1 -- for nvim-tree
glb.fsync = false
-- testing did this save;
-- Examples: >vim
-- 		" Relative number with bar separator and click handlers:
-- 		set statuscolumn=%@SignCb@%s%=%T%@NumCb@%r│%T
--
-- 		" Right aligned relative cursor line number:
-- 		let &stc=y'%=%{v:relnum?v:relnum:v:lnum} 'y
--
-- 		" Line numbers in hexadecimal for non wrapped part of lines:
-- 		let &stc='%=%{v:virtnum>0?"":printf("%x",v:lnum)} '
--
-- 		" Human readable line numbers with thousands separator:
-- 		let &stc='%{substitute(v:lnum,"\\d\\zs\\ze\\'
-- 			   . '%(\\d\\d\\d\\)\\+$",",","g")}'
--
-- 		" Both relative and absolute line numbers with different
-- 		" highlighting for odd and even relative numbers:
-- 		let &stc='%#NonText#%{&nu?v:lnum:""}' .
-- 		 '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' .
-- 		 '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
opt.termguicolors = true
opt.updatetime = 200
opt.splitright = true
opt.splitbelow = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.foldlevel = 999 -- start's folding at the highest nested code, followed by the ones less than that.. etc
opt.softtabstop = 2
opt.expandtab = true
opt.scrolloff = 8 -- check this
opt.sidescrolloff = 8 -- als chehck this
opt.numberwidth = 4
opt.signcolumn = 'yes'
opt.ignorecase = true
opt.cursorline = true
opt.smartcase = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.encoding = 'utf-8' -- encoding, fileencoding, mousemovement, numbers, wrap may not be converted to lua
opt.fileencoding = 'utf-8'
opt.mousemoveevent = true
opt.wrap = false
opt.pumheight = 8
opt.confirm = true
opt.statuscolumn = [[%!v:lua.require('utilities.statuscolumn').statuscolumn()]]
-- opt.smoothscroll = true
-- opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = '', foldclose = ''})
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  -- diff = "╱",
  eob = " ",
}
vim.opt.clipboard = 'unnamedplus'
  -- listchars=tab:> ,trail:-,nbsp:+
-- opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,terminal,winsize,options" --each word enables saving and restoring something -- WARN: cursor disappears/creates a ton of weird buffers indicating path does not exist?
-- opt.laststatus = 3
-- opt.clipboard=unnamedplus; -- does not allow to copy to system clipboard
-- vim.cmd([[
--    set clipboard+=unnamedplus 
--]])
------Floating diagnostics message ----
vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.ERROR
    }, --󰝥
    prefix = "",
  },
  underline = false,
  signs = {
    text = {
      [sign.HINT] = "󰛨", --   hint = '⚑',
      [sign.ERROR] = "✘", --
      [sign.WARN] = "", --   warn = '▲',
      [sign.INFO] = "󰙎", -- info = '»'
    },
  },
}) 
