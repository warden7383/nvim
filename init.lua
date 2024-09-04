vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
          -- testing
	})
end

vim.opt.rtp:prepend(lazypath)

require("utilities")

local lazyconfig = require("plugin.lazyconfig")

require("lazy").setup("lazySpec", lazyconfig) --"lazytest"

require("utilities.autocommands")

vim.cmd([[colorscheme tokyonight]])

require("utilities.highlights")
