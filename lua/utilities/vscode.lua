if vim.g.vscode then
	-- Optional: Disable all diagnostics if preferred, though this also affects linters
	-- vim.diagnostic.enable(false)

	-- Alternatively, modify handlers to hide visual elements (virtual text, signs)
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = false,
		update_in_insert = false,
		underline = false,
	})
end
