local bufferline = require("bufferline")
bufferline.setup{ --some of these features may not work based on terminal type. See :h bufferline-configuration for docs. (or plugin github)
  options = {
    -- style_preset = bufferline.style_preset.minimal, -- NOTE: what does it do? may not work for win term?
    themable = true,
    indicator = {
      icon = '▎',
      style = "underline",
    },
    buffer_close_icon = "󰅙", -- 󰅙󱎘
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false,-- use a "true" to enable the default, or set your own character
      }
    },
    color_icons = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    show_tab_indicators = true,
    separator_style = "thick", 
    always_show_bufferline = true
  }
}

