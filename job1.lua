-- programa em lua
local Job = require "plenary.job"

local function sync_job()
  local job = Job:new {
    command = "ls",
	args = { "-l" },
  } job:sync()

  print(vim.inspect.inspect(job:result()))
end

sync_job()
