local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local hl = vim.api.nvim_set_hl

autocmd({ "TextYankPost" }, {
	command = "lua vim.highlight.on_yank {timeout=700}",
})

-- For .cpp file building and compiling
autocmd({ "BufEnter" }, {
	pattern = { "*.cpp", "*.h" },
	callback = function()
		map(
			"n",
			"<leader>rr",
			'<CMD>TermExec go_back=0 cmd="g++ -pedantic -Wall -Wextra -std=c++17 -g %"<CR>',
			{ desc = "Compile and run", buffer = 0 }
		)
	end,
})

-- NOTE: a slight delay seems to happen when starting a new terminal with ':term' using the
-- mouse and clicking a terminal called with ':term'?
--
-- changes lcd (current directory to local window) to the buffer that was entered
-- mainly used to open a terminal to the path of the buffer it was called on
autocmd({ "BufEnter" }, {
	callback = function()
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")

		if string.find(filename, "pwsh;#toggleterm") or string.find(filename, "zsh;#toggleterm") then
		elseif string.find(filename, "pwsh.EXE") or string.find(filename, "zsh") then
		else
			if string.len(filename) == 0 then
			--gets called in buffers without names, such as alpha and oil
			else
				-- vim.cmd([[
				-- lcd %:p:h
				-- ]])
			end
		end
	end,
})

autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	command = "setlocal cursorline",
})

autocmd({ "WinLeave" }, {
	command = "setlocal nocursorline",
})

autocmd("User", {
	pattern = "AlphaReady",
	command = "set laststatus=0",
})

--resize windows when Vim's window size changes
--also keeps the split window sizes when terminal exits
autocmd({ "VimResized" }, { --TermLeave?
	-- command = "lua require('bufresize').resize()",
	command = "wincmd =",
})

-- when terminal is opened, do not alter split size of other buffers and set keymaps to quit
autocmd({ "TermOpen" }, {
	pattern = "term://*",
	callback = function()
		local opt = vim.opt_local

		-- require("bufresize").block_register()
		-- require("bufresize").resize_open()
		map({ "t" }, "<C-q>", "exit<CR>", { silent = true, desc = "Quit terminal", buffer = 0 }) -- buffer = 0, use in current buffer
		map({ "n" }, "<C-q>", "Aexit<CR>", { desc = "Quit terminal", buffer = 0 })

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
	end,
})

-- When terminal is closed (exited), do not allow the terminal space to move the size of the buffers in
-- the splits and return to normal mode
autocmd({ "TermClose" }, {
	pattern = "term://*",
	callback = function()
		if vim.bo.filetype == "toggleterm" then
		else
			require("bufdelete").bufdelete(0, true)
			-- vim.api.nvim_feedkeys(" q", "n", false)
		end

		-- vim.cmd([[stopinsert]])
		vim.api.nvim_feedkeys("jk", "t", false) --without this, closing terminals will leave you in insert mode
	end,
})

-- Loads the following mappings for the current buffer that is attached to an lsp
autocmd("LspAttach", {
	desc = "LSP Actions",
	callback = function(event)
		map("n", "K", vim.lsp.buf.hover, { desc = "Documentation", buffer = event.buf })
		map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition", buffer = event.buf })
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Implementation", buffer = event.buf })
		map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation", buffer = event.buf })
		map("n", "go", vim.lsp.buf.type_definition, { desc = "Goto Overlad", buffer = event.buf })
		map("n", "gr", vim.lsp.buf.references, { desc = "Goto References", buffer = event.buf })
		map("n", "gs", vim.lsp.buf.signature_help, { desc = "Goto Signature Help", buffer = event.buf })
		map("n", "gl", vim.diagnostic.open_float, { desc = "Goto Line Diagnostics", buffer = event.buf })
		map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous Diagnostic", buffer = event.buf })
		map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next Diagnostic", buffer = event.buf })
		map("n", "ga", vim.lsp.buf.code_action, { desc = "Goto code Action", buffer = event.buf })
	end,
})

autocmd("Filetype", {
	desc = "Disable Cursorline for Telescope",
	pattern = "TelescopePrompt",
	command = "setlocal nocursorline",
})

-- Fixes issue (that seems to appear on windows 11) when wezterm is used with nvim and noice.nvim cmdline is used
-- Cursor changes from the used cursor color in wezterm to white upon exiting noice.nvim's cmdline
-- (Does not happen when noice.nvim is not loaded) (`:verbose set guicursor` returns "guicursor=a:NoiceHiddenCursor Last set from Lua")
autocmd("CmdlineLeave", {
	callback = function()
		hl(0, "NoiceHiddenCursor", { link = "Cursor" })
	end,
})

autocmd("CmdlineEnter", {
	callback = function()
		-- set the default hl from noice.nvim
		vim.cmd([[hi NoiceHiddenCursor cterm=nocombine gui=nocombine blend=100]])
	end,
})

autocmd({ "BufAdd", "BufReadPost" }, {
	pattern = { "*.md", "*.txt", "*.markdown" },
	callback = function() -- Called twice?
		-- vim.api.nvim_set_option_value({ "linebreak" }, { true }, { "local" })
		-- vim.api.nvim_set_option_value({ "wrap" }, { true }, { "local" })
		-- vim.api.nvim_set_option_value("linebreak", true, vim.bo)
		-- vim.api.nvim_set_option_value("wrap", true, vim.bo)
		vim.cmd([[
		    setlocal linebreak
		    setlocal wrap
		  ]])
	end,
})
