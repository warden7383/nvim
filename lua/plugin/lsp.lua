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
	"ts_ls",
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
	-- "rust_analyzer",
}

-- require("neodev").setup({})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()

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

-- NOTE: install rust_analyzer from the rust docs instead of throuigh mason before troubleshooting this
-- lspconfig.rust_analyzer.setup({
-- 	capabilities = capabilities,
-- 	handlers = handlers,
-- 	on_attach = function(client, bufnr)
-- 		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
-- 	end,
-- 	single_file_support = true,
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			imports = {
-- 				granularity = {
-- 					group = "module",
-- 				},
-- 				prefix = "self",
-- 			},
-- 			checkOnSave = true, -- runs `cargo check` to check diagnostics of file upon save.
-- 			cargo = {
-- 				buildScripts = {
-- 					enable = true,
-- 				},
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 			diagnostics = {
-- 				enable = true,
-- 			},
-- 		},
-- 	},
-- })
