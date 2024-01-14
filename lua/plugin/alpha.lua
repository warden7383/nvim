-- require'alpha'.setup(require'alpha.themes.dashboard'.config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local stats = require("lazy").stats()

local autocmd = vim.api.nvim_create_autocmd

dashboard.section.header.val = {
-- [[ _  _ ____ _    _    ____    _  _ ____ ____ _  _ _ _  _   / ]],
-- [[ |__| |___ |    |    |  |    |\ | |___ |  | |  | | |\/|  / ]],
-- [[ |  | |___ |___ |___ |__|    | \| |___ |__|  \/  | |  | . ]], 
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
[[]],
[[]],
}
dashboard.section.buttons.val = {
  dashboard.button("n", "    New file", "<cmd>ene<CR>"),
  dashboard.button("v", "    Load Recent Session", "<cmd>SessionLoadLast<CR>"),
  dashboard.button("s", "󱚄    Load Selected Session", "<cmd>Telescope persisted<CR>"),
  dashboard.button("f", "󰈞    Find project file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("r", "    Recent", "<cmd>Telescope oldfiles<CR>"),
  dashboard.button("g", "󰊄    Grep pattern", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("l", "󰒲    Plugins", "<cmd>Lazy<CR>"),
  dashboard.button("k", "󰌓    Keymaps", "<cmd>Lazy<CR>"),
  dashboard.button("q", "󰿅    Get me out ", "<cmd>qa<CR>"),
}

-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()

autocmd({"User"}, {
  pattern = "LazyVimStarted",
  desc = "Gets the startup time",
  callback = function()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = {
      [[]],
      [[]],
      [[]]..stats.loaded..[[/]]..stats.count..[[ plugins loaded at ]]..ms..[[ms]],
    }
    vim.cmd('AlphaRedraw')
  end,
})

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)

