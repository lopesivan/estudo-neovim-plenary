local luajob = require('luajob')
local git_branch = luajob:new({
	cmd = 'git branch',
	on_stdout = function(err, data)
		if err then
			print('error:', err)
		elseif data then
			lines = vim.fn.split(data, '\n')
			for _, line in ipairs(lines) do
				if line:find('*') then
					vim.api.nvim_set_var('git_branch', (line:gsub('\n', '')))
				end
			end
		end
	end
})
git_branch:start()

-- Teste
-- :echo git_branch
