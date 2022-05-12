local plenary_window = require "plenary.window.float"
local Job = require("plenary.job")

local float = plenary_window.percentage_range_window(0.9, 0.8)

local job_id = vim.api.nvim_open_term(float.bufnr, {})

Job:new{
	command = "go",
	args = "-v",
	on_stdout = vim.schedule_wrap(function(_, data)
		-- local output = str.get_test_output(data)
		vim.api.nvim_chan_send(job_id, data)
	end),
	on_stderr = vim.schedule_wrap(function(_, data)
		vim.api.nvim_err_writeln(data)
	end),
}:start()
