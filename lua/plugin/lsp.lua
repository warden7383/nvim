local lspconfig = require("lspconfig")
local lsp = {
    "bashls",
    "clangd",
    "cssls",
    "cssmodules_ls",
    "efm",
    "html",
    "htmx",
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
    "svelte",
    "lemminx",
    "yamlls",
}

require("neodev").setup({

})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, i in ipairs(lsp) do
  lspconfig[i].setup{
    -- on_attach = on_attach,
    capabilities = capabilities,
  }
end
