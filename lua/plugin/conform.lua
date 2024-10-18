local hostname = vim.uv.os_uname().sysname

-- TODO: find the hostname to windows 11 to check for a windows machine (part fix for %userprofile% dir with spaces)
local function formatterCommand()
	if hostname == "Darwin" then
		return {
			stylua = "stylua",
			test = "testing",
		}
	elseif hostname == "Windows_NT" then
		return {
			stylua = "stylua.exe",
		}
	else -- linux os
		return {
			stylua = "stylua",
		}
	end
end

require("conform").setup({
	log_level = vim.log.levels.DEBUG,
	formatters_by_ft = {
		lua = {
			"stylua",
		},
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		cpp = {
			"clang_format",
		},
		-- rust = { "rustfmt", lsp_format = "fallback" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = false,
	},
	notify_on_error = true,
	notify_no_formatters = true,

	formatters = {
		stylua = {
			-- NOTE: explosing the formatter to the .exe while adding the formatter to the system
			-- PATH seems to help instead of just exposing conform to the "stylua" command
			-- command = "stylua.exe",
			command = formatterCommand().stylua,
		},
		clang_format = {
			command = "clang-format",
			args = {
				"-style=file",
			},
		},
	},
})
