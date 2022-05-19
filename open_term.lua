-- programa em lua


local buf = vim.api.nvim_create_buf(false, true)
local win = vim.api.nvim_open_win(buf, true, {relative = "cursor", width= 30, height= 10, row= 1, col= 1, border = "single"})
local term = vim.api.nvim_open_term (buf, {cmd='sh'})
local data = "pwd\npwd" -- Swap `\n` with `\r\n` to see difference
vim.api.nvim_chan_send(term, data)
