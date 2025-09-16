-- Styles are in ./stylesConfig.lua
local config = {
	enabled = true,
}

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter" }, {
	command = "lua Snacks.input.enable()",
})

return config
