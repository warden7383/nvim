local lspconfig = require("lspconfig")

-- sets the 'LspInfo' ui to have rounded borders (and possibly other things?)
require('lspconfig.ui.windows').default_options.border = "rounded"

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

-- TODO: do on_attach keybindings for goto definiition/hovers etc?
for _, i in ipairs(lsp) do
  if i == "clangd" then
    lspconfig[i].setup{
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }
  else
    lspconfig[i].setup{
      capabilities = capabilities,
    }
  end
  -- NOTE: produced offset_encodin warnings for cpp clangd (see below)
  --
  -- lspconfig[i].setup{
  --   -- on_attach = on_attach, -- use later
  --   capabilities = capabilities,
  -- }
end
