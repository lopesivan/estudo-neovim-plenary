
-- local filename = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), " ")
--[[
pessoal, como converto para lua essa linha de comando ???
call jobstart('nvim -h', {'on_stdout':{j,d,e->append(line('.'),d)}})
]]
vim.fn.jobstart(‘nvim -h’, {
	on_stdout = function(j, d, e)
		vim.fn.append(vim.fn.line(‘.’), d)
	end
})
