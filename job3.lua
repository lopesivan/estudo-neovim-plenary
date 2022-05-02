-- programa em lua

local Job = require "plenary.job"

local function callback_job()
  local stdout_results = {}
  local job = Job:new {
	command = "ls",
	args = { "/" },
	on_stdout = function(_, line)
	  table.insert(stdout_results, line)
	end,
  } job:sync()

  print(vim.inspect.inspect(stdout_results))
end

callback_job()
