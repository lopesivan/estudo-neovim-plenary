-- programa em lua

local plenary_window = require "plenary.window.float"

local float = plenary_window.percentage_range_window(0.9, 0.8)
vim.api.nvim_buf_set_lines(float.bufnr, 0, 1, false, {'one'})
vim.api.nvim_buf_set_lines(float.bufnr, 1, 2, false, {'two'})
vim.api.nvim_buf_set_lines(float.bufnr, 3, 4, false, {'three'})
vim.api.nvim_buf_set_lines(float.bufnr, 5, 6, false, {'four'})

local closing_keys = {'q', '<Esc>', '<CR>', '<Leader>', '<C-c>'}
local map_options = {
	noremap = true,
	silent = true,
}

for _, key in ipairs(closing_keys) do
	vim.api.nvim_buf_set_keymap(float.bufnr, 'n', key, '<CMD>close!<CR>', map_options)
end
-- vim.cmd('close!')
