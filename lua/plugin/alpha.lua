-- require'alpha'.setup(require'alpha.themes.dashboard'.config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local lazy = require("lazy")
local stats = lazy.stats()
local m = "testing"

local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
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
  dashboard.button("v", "    Source session", "<cmd>SessionRestore<CR>"),
  dashboard.button("f", "󰈞    Find project file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("r", "    Recent", "<cmd>Telescope oldfiles<CR>"),
  dashboard.button("g", "󰊄    Grep pattern", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("l", "󰒲    Plugins", "<cmd>Lazy<CR>"),
  dashboard.button("q", "󰿅    Get me out ", "<cmd>qa<CR>"),
}
-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()
dashboard.section.footer.val = {
[[                ]]..stats.loaded..[[ / ]]..stats.count..[[ plugins       ]],
[[                at ]]..ms..[[ms]],
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)

