-- require'alpha'.setup(require'alpha.themes.dashboard'.config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
[[                            ╱|、       ]],
[[                          (˚ˎ 。7      ]],
[[                           l、˜ 〵     ]],
[[                           じしˍ,)ノ   ]],
[[                                       ]],
[[                            ⠀ ⁄\、     ]],
[[                            （ﾟ､ ｡７   ]],
[[                           ⠀ |、ﾞ ~ヽ  ]],
[[                             じしf_,)ノ]],
}
dashboard.section.buttons.val = {

}
local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune

dashboard.config.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)

