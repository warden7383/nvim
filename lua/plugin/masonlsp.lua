require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"cssls",
		"cssmodules_ls",
		--"efm",
		"html",
		--    "htmx", failed to install
		"jsonls",
		"jdtls",
		"ts_ls",
		"jqls",
		"lua_ls",
		"marksman",
		"intelephense",
		"powershell_es",
		"pyright",
		"sqlls",
		--"svelte", not needed yet
		"lemminx",
		"yamlls",
		-- "beautysh", -- NOTE: will give a warning, prob because its a formatter and not a lsp
		"hls", -- haskel-language-server
		"gopls",
		"asm_lsp",
		"eslint",
		-- "ltex-ls-plus", -- NOTE: does causes a warning to show up
	},
})
