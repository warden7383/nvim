local cmp = require("cmp")
local lspkind = require("lspkind")
local handlers = require('nvim-autopairs.completion.handlers')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require("tailwindcss-colorizer-cmp").setup({
  color_square_width = 2,
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  -- window = {
  --   completion = {
  --     border = "rounded",
  --     -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
  --     col_offset = -3,
  --     side_padding = 1,
  --     scrollbar = false,
  --     scrolloff = 8,
  --   },
  --   documentation = {
  --     border = "rounded",
  --     -- winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
  --   },
  -- },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    scrollbar = false,
  },

  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({"path"}, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        emoji = "[Emoji]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return require('lspkind').cmp_format({ with_text = true, maxwidth = 50 })(entry, vim_item)
    end,
  },

  experimental = {
    ghost_text = true,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  sources = cmp.config.sources({
    {name = "nvim_lsp"},
    {name = 'nvim_lsp_signature_help'},
    {name = "luasnip"},
    {name = "buffer"},
    {name = "path"},
    {name = "calc"},
    {name = "emoji"},
  }),
})
-- from the tailwindcss-colorizer-cmp docs
-- require("cmp").config.formatting = {
--   format = require("tailwindcss-colorizer-cmp").formatter
-- }
cmp.config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    {name = "git"},
    {name = "buffer"},
  })
})

cmp.setup.cmdline({"/", "?"}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = "buffer"},
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = "async_path"},
    -- {name = "path"}, -- WARNING: will block/freeze, use async_path instead
    {name = "cmdline"},
  })
})


require("plugin.lsp")
