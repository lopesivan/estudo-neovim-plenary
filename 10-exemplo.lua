
-- WIP lua version in floating buffer
-- local npm_command = 'npm ' .. args
local npm_command = 'npm'
local npm_buf = vim.api.nvim_create_buf(false, false)
local npm_win = vim.api.nvim_open_win(npm_buf, true,
{
  relative='win',
  row=60,
  col=30,
  width=40,
  height=40,
  style='minimal',
  border='double'
})
local npm_term = vim.api.nvim_open_term(npm_buf, {})
-- vim.api.nvim_chan_send(npm_term, 'whoami')
vim.api.nvim_chan_send(npm_term, npm_command)
-- print(npm_output)
