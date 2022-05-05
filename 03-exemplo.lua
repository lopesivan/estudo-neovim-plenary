-- programa em lua
local Job = require('plenary.job');

local _, code = Job:new({
	command = 'fmt',
	args = { "--version", ">", "pedraverde.txt"  },
	cwd = '.',
	env = { PATH = vim.env.PATH },
}):sync()

if code ~= 0 then
	error(string.format('failed to call (%d)', code))
end
