-- programa em lua

-- programa em lua
local Job = require "plenary.job"

local function sync_job()
  local job = Job:new {
    command = "fmt",
	args = { "--help" },
  } job:sync()

  print(vim.inspect.inspect(job:result()))
end

sync_job()
