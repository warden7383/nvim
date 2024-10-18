local buffers = 0
local window = 0

vim.api.nvim_create_user_command("BDelete", function()
	return vim.notify("hi")
end, { desc = "Delete the bufer without losing window layout" })

vim.api.nvim_create_user_command("Test", function()
	local buf = vim.api.nvim_win_get_buf(0)
	local wins = vim.api.nvim_list_wins()
	local keys = vim.tbl_keys(wins)
	local values = vim.tbl_keys(wins)
	-- local i = 1

	-- for i=10,1,-1 do print(i) end

	for i = 1, #keys, 1 do
		print(keys[i])
	end

	return print(#values)
end, { desc = "test" })
