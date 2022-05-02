-- programa em lua
local Job = require "plenary.job"

local results = {}

Job:new({
	command = 'bash',
	args = { "ex_1.sh" },
	cwd = '/workspace',
	env = { ['a'] = 'b' },
	on_stdout = function(_, line)
		print "first job"
		table.insert(results, line)
	end,
}):sync() -- or start()

print(vim.inspect.inspect(results))
