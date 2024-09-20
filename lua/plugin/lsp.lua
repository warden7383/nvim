local lspconfig = require("lspconfig")
local filetype = require("mason-lspconfig.mappings.filetype")

-- sets the 'LspInfo' ui to have rounded borders (and possibly other things?)
require("lspconfig.ui.windows").default_options.border = "rounded"

local lsp = {
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	--"efm",
	"html",
	--"htmx",
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
	--"svelte",
	"ltex",
	"lemminx",
	"yamlls",
}

-- require("neodev").setup({})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = { "documentation", "detail", "additionalTextEdits" },
-- }
-- local on_attach = function(client, bufnr)
-- insert keymaps here
--   if client.server_capabilities["documentSymbolProvider"] then
--     require("nvim-navic").attach(client, bufnr)
--   end
-- end
--
for _, i in ipairs(lsp) do
	if i == "clangd" then
		lspconfig[i].setup({
			-- on_attach = on_attach,
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
			handlers = handlers,
		})
	else
		lspconfig[i].setup({
			-- on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end
	-- NOTE: produced offset_encodin warnings for cpp clangd (see below)

	-- if i == "textlsp" then
	-- 	lspconfig[i].setup({
	-- 		filetypes = { "text", "markdown", "txt", "md" },
	-- 	})
	-- end
end
