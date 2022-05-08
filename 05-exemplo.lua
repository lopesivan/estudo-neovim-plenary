local luajob = require('luajob')
local git_branch = luajob:new({
	cmd = 'gcc -v',
	on_stdout = function(err, data)
		if err then
			print('error:', err)
		elseif data then
			lines = vim.fn.split(data, '\n')
			for _, line in ipairs(lines) do
					print(line:gsub('\n', ''))
			end
		end
	end
})
git_branch:start()

-- Teste
-- :echo git_branch
