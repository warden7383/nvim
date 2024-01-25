vim.g.lspTimeoutConfig = {
  stopTimeout  = 1000 * 60 * 15, -- ms, timeout before stopping all LSPs 
  startTimeout = 1000 * 10,     -- ms, timeout before restart
  silent = false,          -- true to suppress notifications,
  filetypes    = {
    ignore = {                -- filetypes to ignore; empty by default
      -- lsp-timeout is disabled completely
    }                         -- for these filetypes
  }
}

-- local Config = require("lsp-timeout.config").Config
-- Config:new(vim.g.lspTimeoutConfig):validate()

-- for testing:
-- vim.api.nvim_create_autocmd({"LspDetach"},{
--   pattern = "*",
--   callback = function()
--     print("Lsp timed out")
--   end,
-- })
