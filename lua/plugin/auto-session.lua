-- local autoSession = require("auto-session")

-- autoSession.setup({
--   log_level = "warn",
--   auto_session_enable_last_session = false,
--   auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
--   auto_session_enabled = true,
--   auto_session_create_enabled = true,
--   auto_save_enabled = true,
--   auto_restore_enabled = false,
--   auto_session_suppress_dirs = nil,
--   auto_session_allowed_dirs = nil,
--   auto_session_use_git_branch = false, -- WARN: will not load your session as it suffixes the branch at the end of the file it seems?
--   bypass_session_save_file_types = {
--     "alpha",
--     "NvimTree",
--     "checkhealth",
--   },
-- })

-- Deletes the alternate buffer of '#' to prevent duplicate buffers bleeding when a session is restored
-- NOTE: TEMP solution to bleeding buffers
local function delAltBuf()
  local bufNum = vim.fn.bufnr("#")
  if bufNum == -1 then
    -- print("No bleeding buffers")
  else
    -- print("Bleeding buffer found, deleting...")
    vim.cmd("bdelete #")
  end
end

require("auto-session").setup({
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = nil,
  auto_session_allowed_dirs = nil,
  auto_session_use_git_branch = false, -- WARN: will not load your session as it suffixes the branch at the end of the file it seems?
  bypass_session_save_file_types = {
    "alpha",
    "NvimTree",
    "checkhealth",
  },
  -- post_restore_cmds = {"bdelete #"},
  post_restore_cmds = {delAltBuf}, -- NOTE: buffer restore seems to be bleeding into the "# register(???) this is a temp. fix to deleting the buffer at "# after restoring sessions
})

function SessionStop()
  -- autoSession.auto_save_enabled = false
end
