local api = vim.api
local bufferline = require("bufferline")

bufferline.setup{ --some of these features may not work based on terminal type. See :h bufferline-configuration for docs. (or plugin github)
  highlights = {
    --hover event close button
    close_button = {
      fg = '#f7768e',
      bg = '',
    },
    --active buffers in a split window
    close_button_visible = {
      fg = '#f7768e',
      bg = '#414057',
    },
    --the active buffer's close button (the currently active buffer)
    close_button_selected = {
      fg = '#f7768e',
      bg = '#414057',
    },
    --the selected active buffer (close_button_selected must have the same color as this)
    buffer_selected = {
      fg = '#7de1ff', --#79b1b5 #7de1ff
      bg = '#414057',
      bold = true,
      italic = true,
      underline = false,
    },
    -- adding colors to this results in changing all buffers that are modified
    modified = {
      -- fg = '',
      -- bg = '#414057',
    },
    modified_selected = {
      -- fg = '',
      bg = '#414057',
    },
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
    show_tab_indicators = true,
    separator_style = {},
    always_show_bufferline = true
  }
}


