local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local stats = require("lazy").stats()

local autocmd = vim.api.nvim_create_autocmd

dashboard.section.header.val = {
[[   ┌─────────────────────────────────────────────────────────────────────┐ ]],
[[   │                                                                     │ ]],
[[   │                                                                     │ ]],
[[   │           ___            __           ___  __                 /     │ ]],
[[   │     |__| |__  |    |    /  \    |\ | |__  /  \ \  / |  |\/|  /      │ ]],
[[   │     |  | |___ |___ |___ \__/    | \| |___ \__/  \/  |  |  | .       │ ]],
[[   │                                                                     │ ]],
[[   │                                                                     │ ]],
[[   │                                                                     │ ]],
[[   └─────────────────────────────────────────────────────────────────────┘ ]],
[[                                                              o      ]],
[[                                                               o     ]],
[[                                                                o          ]],
[[                                           ⠀                     ⁄\、     ]],
[[                                                               （ﾟ､ ｡７   ]],
[[                                       ⠀                        |、ﾞ ~ヽ  ]],
[[                                                                じしf_,)ノ]],
[[]],
}

dashboard.section.buttons.val = {
  dashboard.button("n", "    New file", "<cmd>ene<CR>"),
  -- dashboard.button("v", "    Load Recent Session", "<cmd>SessionLoadLast<CR>"),
  dashboard.button("v", "    Load Session(cwd)", ":SessionRestore<CR>"),
  -- dashboard.button("s", "󱚄    Load Selected Session", "<cmd>Telescope persisted<CR>"),
  dashboard.button("s", "󱚄    Select Session", ":Autosession search<CR>"),
  dashboard.button("f", "    Find project file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("r", "    Recent", "<cmd>Telescope oldfiles<CR>"),
  dashboard.button("g", "󰊄    Grep pattern", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("l", "󰐱    Plugins", "<cmd>Lazy<CR>"),
  dashboard.button("c", "    Config", "<cmd> e $MYVIMRC <cr>"),
  dashboard.button("q", "󰿅    Get me out ", "<cmd>qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons" 
dashboard.section.footer.opts.hl = "AlphaFooter"
-- dashboard.opts.layout[1].val = 5 --changes the layout of the header

autocmd({"User"}, {
  pattern = "LazyVimStarted",
  desc = "Gets the startup time",
  callback = function()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = {
      [[]],
      [[]],
      [[⚡ ]]..stats.loaded..[[/]]..stats.count..[[ plugins in ]]..ms..[[ms  ⚡]],
    }
    vim.cmd('AlphaRedraw')
  end,
})

dashboard.config.opts.noautocmd = false

alpha.setup(dashboard.config)
