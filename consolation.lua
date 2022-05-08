-- programa em lua

local Wrapper = require("consolation").Wrapper

local b	= Wrapper:new()

b:setup {
	create = function() vim.cmd("vnew | term") end,
	open = function(self)
		if self:is_open() then
			local winnr = vim.fn.bufwinnr(self.bufnr)
			vim.cmd(winnr.."wincmd w")
		else
			vim.cmd("vnew")
			vim.cmd("b"..self.bufnr)
		end
	end,
	close = function(self)
		local winnr = vim.fn.bufwinnr(self.bufnr)
		vim.cmd(winnr.."wincmd c")
	end,
	kill = function(self)
		vim.cmd("bd! "..self.bufnr)
	end
}



b:open {cmd = "echo hi>aa"}
b:send_command {cmd = "echo hi again>>aa"}
b:send_command {cmd = "exit"}
b:close()
-- b:toggle()
-- b:kill()
