-- programa em lua

local plenary_window = require "plenary.window.float"

local info = plenary_window.percentage_range_window(0.9, 0.9, {})
  local bufh = info.bufnr
  vim.fn.termopen("ls")
