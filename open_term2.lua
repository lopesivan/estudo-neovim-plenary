-- programa em lua

buf = vim.api.nvim_create_buf(false, true)
local border_buf = vim.api.nvim_create_buf(false, true)

vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

local width = vim.api.nvim_get_option("columns")
local height = vim.api.nvim_get_option("lines")

local win_height = math.ceil(height * 0.8 - 4)
local win_width = math.ceil(width * 0.8)
local row = win_height--math.ceil((height - win_height) / 2 - 1)
local col = 10 --math.ceil((width - win_width) / 2)

local opts = {
	style = "minimal",
	relative = "editor",
	width = win_width,
	height = win_height,
	row = row,
	col = col
}
win = vim.api.nvim_open_win(buf, true, opts)
vim.api.nvim_win_set_option(win, 'cursorline', true) -- it highlight line with the cursor on it
local f = vim.api.nvim_open_term(buf, {cmd = 'fzf'})

