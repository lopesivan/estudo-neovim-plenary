-- programa em lua
local Job = require "plenary.job"
Job:new({
  command = 'bash',
  args = { "bb.sh" },
  cwd = '/workspace',
  env = { ['a'] = 'b' },
  on_exit = function(j, return_val)
    local r = vim.inspect(return_val)
    if r then
		print(vim.inspect(j:result()))
	else
		print('Error:', r)
	end

  end,
}):sync() -- or start()
