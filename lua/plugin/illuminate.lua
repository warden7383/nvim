require('illuminate').configure({
  under_cursor = true,
  min_count_to_highlight = 2,
  filetypes_denylist = {
    'alpha',
    'NvimTree',
    'dashboard',
    'checkhealth',
    -- 'fugitive',
  },
})

