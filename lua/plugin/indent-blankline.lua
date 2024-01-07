-- Version 2 to version 3 migration:
require("ibl").setup {
  -- for example, context is off by default, use this to turn it on
  -- show_current_context = true,
  -- show_current_context_start = true,
  exclude = {
    buftypes = {
    },
    filetypes = {
      "dashboard",
    },
  },
}

