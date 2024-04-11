local api = vim.api
local bufferline = require("bufferline")

bufferline.setup{ --some of these features may not work based on terminal type. See :h bufferline-configuration for docs. (or plugin github)
  highlights = {
    background = {
    },
    --hover event close button
    close_button = {
      fg = '#ed8796',
      bg = '',
    },
    --active buffers in a split window
    close_button_visible = {
      fg = '#ed8796',
      bg = '#24273a',
    },
    --the active buffer's close button (the currently active buffer)
    close_button_selected = {
      fg = '#ed8796',
      bg = '#24273a',
    },
    --the selected active buffer (close_button_selected must have the same color as this)
    buffer_selected = {
      -- fg = '#7de1ff', --#79b1b5 #7de1ff
      fg = '#cad3f5',
      bg = '#24273a',
      bold = true,
      italic = true,
      underline = false,
    },
    tab_selected = {
      fg = '#8bd5ca', --#79b1b5 #7de1ff
      bg = '#24273a',
      bold = true,
      italic = true,
      underline = false,
    },

    tab_close = {
      fg = '#ed8796',
      bg = '#24273a',
    },
    numbers_selected = {
      fg = '#cad3f5', --#79b1b5 #7de1ff
      bg = '#24273a',
      bold = true,
      italic = true,
      underline = false,

    },
    tab_separator = {
    },
    tab_separator_selected = {
    },
    -- separator_selected = {
    --
    --   fg = "#000000",
    --   bg = "#000000",
    -- },
    -- separator_visible = {
    --
    --   fg = "#000000",
    --   bg = "#000000",
    -- },
    -- indicator_visible = {
    --   fg = "#000000",
    --   bg = "#000000",
    -- },
    -- indicator_selected = {
    --   bg = "#000000",
    --   fg = "#000000"
    -- },
    -- adding colors to this results in changing all buffers that are modified
    modified = {
      -- fg = '',
      -- bg = '#414057',
    },
    modified_selected = {
      -- fg = '',
      bg = '#24273a',
    },

    -- offset_separator = {
    --   bg = "#000000"
    -- }
  },

  options = {
    -- style_preset = bufferline.style_preset.minimal, -- NOTE: what does it do? may not work for win term?
    themable = true,
    indicator = {
      -- icon = '▎',
      icon = '',
      -- style = "underline",
    },
    buffer_close_icon = "󰅙", -- 󰅙󱎘
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(name)
    end,

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false,-- use a "true" to enable the default, or set your own character
      }
    },
    color_icons = true,
    get_element_icon = function(element)
      local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, {default = false})
      return icon, hl
    end,
    hover = {
      enabled = true,
      delay = 100,
      reveal = {'close'}
    },
    numbers = function(opts)
      return string.format('')
    end,
    show_tab_indicators = true,
    separator_style = {},
    always_show_bufferline = true,
    -- max_name_length = 15,
  }
}


