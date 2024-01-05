local opt = vim.opt
local api = vim.api
local glb = vim.g

local sign = vim.diagnostic.severity
-- glb.mapleader = " "

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

--glb.loaded_netrw = 1 -- for nvim-tree
--glb.loaded_netrwPlugin = 1 -- for nvim-tree
local ok, hl = pcall(vim.api.nvim_get_hl_by_name, "Normal", true)

--ENABLE WHEN nvim-tree IS INSTALLED
glb.loaded_netrw = 1 -- for nvim-tree
glb.loaded_netrwPlugin = 1 -- for nvim-tree

opt.termguicolors = true
opt.tabstop = 2
opt.shiftwidth = 2
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

-- opt.clipboard=unnamedplus; -- does not allow to copy to system clipboard
-- vim.cmd([[
--    set clipboard+=unnamedplus 
--]])
------Floating diagnostics message ----
--vim.diagnostic.config({
--    float = {source = "always", border = border },
--    virtual_text = false,
--        signs = true,
--})
vim.cmd([[
autocmd BufEnter * lcd %:p:h
]])

vim.diagnostic.config({
  virtual_text = false,
  underline = false,
  signs = {
    text = {
      [sign.HINT] = "󰛨",
      [sign.ERROR] = "",
      [sign.WARN] = "",
      [sign.INFO] = "",
    },
  },
})

print("loaded options")
