local window = {}

local function winStats()
	return {
		height = math.floor(vim.o.lines - (vim.o.lines * 0.2)),
		width = math.floor(vim.o.columns - (vim.o.columns * 0.2)),
		xCoord = vim.o.lines * 0.1,
		yCoord = vim.o.columns * 0.1,
	}
end

local map = vim.keymap.set

require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	hide_numbers = true,
	highlights = {
		Normal = {
			-- guibg = "#24283b"
		},
		NormalFloat = {
			-- guibg = "#24273a"
		},
		FloatBorder = {
			guifg = "#c6a0f6",
			-- guibg = "#24273a" --#24273a  #24283b
		},
	},
	autochdir = true,
	shade_terminals = true,
	shading_factor = "30",
	float_opts = {
		border = "curved",
		width = window.width,
		height = window.height,
		row = window.xCoord,
		col = window.yCoord,
		winblend = 0,
		title_pos = "center",
	},
})

map("n", "<leader>tt", ":ToggleTerm<CR>", { silent = true })
map("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { silent = true })

map("n", "<leader>tf", function()
	window = winStats()
	vim.cmd([[
  lcd %:p:h
  ToggleTerm direction=float
  ]])
end, { silent = true })

map("n", "<leader>tv", function()
	window = winStats()
	vim.cmd([[
  lcd %:p:h
  ToggleTerm direction=vertical
  ]])
end, { silent = true })

map("n", "<leader>th", function()
	window = winStats()
	vim.cmd([[
  lcd %:p:h
  ToggleTerm direction=horizontal
  ]])
end, { silent = true })

map("t", "jk", "<C-\\><C-n>", { desc = "Exit insert mode(Terminal)", silent = true })
