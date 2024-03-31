local data = vim.fn.stdpath("data") .. "/mason/bin/stylua"
print(data)
-- stylua ready (lua) C:\Users\Andrew Ng\AppData\Local\nvim-data\mason\bin\stylua.CMD
require("conform").setup({
  log_level = vim.log.levels.TRACE,
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    cpp = {},
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = false,
  },
  formatters = {
    stylua = {
      -- command = "C:\\Users\\Andrew Ng\\AppData\\Local\\nvim-data\\mason\\bin\\stylua",
      -- WARN: spaces in directorys must be escaped with quotes
      command = 'C:/Users/\'Andrew Ng\'/AppData/Local/nvim-data/mason/bin/stylua',
    },
  },
})
