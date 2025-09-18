local config = {
	---@class snacks.layout.Config
	---@field show? boolean show the layout on creation (default: true)
	---@field wins table<string, snacks.win> windows to include in the layout
	---@field layout snacks.layout.Box layout definition
	---@field fullscreen? boolean open in fullscreen
	---@field hidden? string[] list of windows that will be excluded from the layout (but can be toggled)
	---@field on_update? fun(layout: snacks.layout)
	---@field on_update_pre? fun(layout: snacks.layout)

	enabled = false,
	layout = {
		width = 0.6,
		height = 0.6,
		zindex = 50,
	},
}

return config
