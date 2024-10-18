local buffers = 0
local window = 0

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

vim.api.nvim_create_user_command("BDelete", function()
	return vim.notify("hi")
end, { desc = "Delete the bufer without losing window layout" })

vim.api.nvim_create_user_command("Test", function()
	local buf = vim.api.nvim_win_get_buf(0)
	local bufList = vim.api.nvim_list_bufs()
	local wins = vim.api.nvim_list_wins()
	local keys = vim.tbl_keys(wins)
	local values = vim.tbl_values(wins)
	local filteredBufs = {}

	-- print("buflist:" .. #bufList)
	-- for i, v in ipairs(bufList) do
	-- 	print("KEY: " .. i .. " VALUE: " .. v)
	-- end

	for i, v in ipairs(bufList) do
		print(v .. " ")
		if vim.api.nvim_buf_is_loaded(12) == true then
			print("TRUE ")
			filteredBufs[i] = v
		end
	end

	for i, v in ipairs(filteredBufs) do
		print("FILTERED: " .. i .. " VALUE: " .. v)
	end

	return print("table: " .. dump(bufList))
end, { desc = "test" })
