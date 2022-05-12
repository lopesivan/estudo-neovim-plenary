-- programa em lua
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local previewers = require('telescope.previewers')

local Job = require("plenary.job")

local get_job_opts = function(chan, cmd)
  local writer = vim.schedule_wrap(function(_, data)
      vim.api.nvim_chan_send(chan, data .. '\r\n')
  end)
  cmd.on_stdout = writer
  cmd.on_stderr = writer
  return cmd
end

pickers.new({}, {
  finder = finders.new_table {
    results = {"dummy_result"}
  },
  previewer = previewers.new_buffer_previewer{
    define_preview = function(self, entry, status)
      local chan = vim.api.nvim_open_term(self.state.bufnr, {})
      Job:new(get_job_opts(chan, { 'bat', '--color', 'always', vim.fn.expand('~/.config/nvim/scratch/estudo-neovim-plenary/LICENSE') })):start()
    end
  }
}):find()
