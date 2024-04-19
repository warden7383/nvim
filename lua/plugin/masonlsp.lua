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
		"tsserver",
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
	},
})
