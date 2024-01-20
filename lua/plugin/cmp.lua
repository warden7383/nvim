local cmp = require("cmp")
-- local handlers = require('nvim-autopairs.completion.handlers')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local tailwindColor = require("tailwindcss-colorizer-cmp")

tailwindColor.setup({
  color_square_width = 2,
})

-- WARN: the following code does not work
--
-- cmp.setup {                                                                                                                                                                                                                                 
--   enabled = function()
--     return not cmp.config.context.in_treesitter_capture('Comment')
--   end,
-- }
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup({
  performance = {
    trigger_debounce_time = 500,
    throttle = 550,
    fetching_timeout = 80, 
    debounce = 150,
  },
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment") 
      and not context.in_syntax_group("Comment")
    end
  end,

  completion = {
    completeopt = 'menu,menuone',
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  window = {
    completion = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",--"Normal:Pmenu,CursorLine:CmpCursorLine,Search:None",
      col_offset = 0,
      border = "rounded",
      side_padding = 0,
      scrollbar = false,
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
      max_width = 80,
      max_height = 12,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- if vim.tbl_contains({"path"}, entry.source.name) then
      --   local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
      --   if icon then
      --     vim_item.kind = icon
      --     vim_item.kind_hl_group = hl_group
      --     return vim_item
      --   end
      -- end

      -- vim_item.menu = ({
      --   buffer = "[Buffer]",
      --   nvim_lsp = "[LSP]",
      --   luasnip = "[Snippet]",
      --   nvim_lua = "[Lua]",
      --   latex_symbols = "[LaTeX]",
      --   cmdline = "[Cmdline]",
      --   async_path = "[Path]",
      -- })[entry.source.name]

      local kind = require('lspkind').cmp_format({
        with_text = true,
        maxwidth = 40, -- NOTE: initial was 50, set higher for longer width of completion menu
        ellipsis_char = "...",
        before = tailwindColor.formatter,
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " │"
      kind.menu = " (" .. (strings[2] or "") .. ")"
      return kind

      -- return require('lspkind').cmp_format({ 
      --   with_text = true, 
      --   maxwidth = 50,
      --   -- ellipsis_char = "...",
      --   -- before = tailwindColor.formatter,
      -- })(entry, vim_item)
    end,
  },

  experimental = {
    ghost_text = true,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-l>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ['<C-d>'] = function()
      if cmp.visible_docs() then
        cmp.close_docs()
      else
        cmp.open_docs()
      end
    end,
  }),
  sources = cmp.config.sources({
    {name = "nvim_lsp", keyword_length = 3,},
    {name = 'nvim_lsp_signature_help', keyword_length = 2},
    {name = "luasnip"},
    {name = "buffer", keyword_length = 2},
    {name = "path", keyword_length = 3, },
    {name = "calc"},
    {name = "emoji"},
    {name = "cmdline"},
    {name = "async_path", keyword_length = 3,}
  }),
})
-- from the tailwindcss-colorizer-cmp docs
-- require("cmp").config.formatting = {
--   format = require("tailwindcss-colorizer-cmp").formatter
-- }

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
    {name = "async_path", keyword_length = 1},
    -- {name = "path"}, -- WARNING: will block/freeze, use async_path instead
    {
      name = "cmdline",
      option = {
        ignore_cmds = { 'Man', '!' }
      },
    },
  })
})

require("plugin.lsp")
