local popup = require "plenary.popup"

vim.cmd [[
highlight PopupColor ctermbg=black ctermfg=blue guifg=blue guibg=green
]]

local function create_highlight_popup()
  local win_id = popup.create(
	{ "item 1",
	  "item 2",
	  "item 3" },
	{
	  line = 15,
	  col = 45,
	  minwidth = 20,
	  border = true,
	  highlight = "PopupColor",
	})
  print(win_id)
end

create_highlight_popup()
