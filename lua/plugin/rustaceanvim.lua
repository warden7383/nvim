-- TODO:
vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
		float_win_config = {
			border = "rounded",
		},
		hover_actions = {
			replace_builtin_hover = true,
		},
	},
	-- LSP configuration
	--
	server = {
		-- on_attach = function(client, bufnr)
		-- 	-- you can also put keymaps in here
		-- 	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Rust", buffer = bufnr })
		-- end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				checkOnSave = false,
				-- check = {
				-- 	command = "clippy",
				-- },
			},
		},
	},
	-- DAP configuration
	-- dap = {
	-- },
}

-- alternative to `cargo check` that runs in the background thread, see docs
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.rs",
	callback = function()
		vim.cmd.RustLsp("flyCheck")
	end,
})
