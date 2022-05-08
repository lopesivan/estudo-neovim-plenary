Job Control

   I’m using this term to refer to starting, communicating with and
   otherwise controlling external processes. There are a few options
   available, with different trade offs.

Vim system or systemlist

   It is possible to use the Vim system or systemlist APIs.
local result = vim.fn.system("ls")
if vim.api.nvim_get_vvar("shell_error") != 0 then
    -- Error handling.
else
    -- Success handling.
end

   The drawbacks are:
    1. Neovim will be paused while the external process completes
       execution.

Vim jobstart

   The Neovim job control API is available in Lua like so:
vim.fn.jobstart("ls")

   However, at the moment, it is unable to accept the second parameter
   that allows callbacks to be configured. There is an open issue,
   neovim/7607.

Lua popen

local handle = io.popen("ls")
local result = handle:read("*a")
handle:close()

   The drawbacks are:
    1. It isn’t straightforward to capture the result code of the process
       execution. Stackoverflow Discussion
    2. It isn’t straightforward to capture the stdout and stderr.
    3. Neovim will be paused while the external process completes
       execution.

Networking, Communication and Job Control

How to use Neovim to send a message to a Running Neovim instance

nvim --noplugin --cmd "lua vim.fn.rpcrequest(vim.fn.sockconnect('pipe', '/var/fo
lders/nh/lwpxl66111j103y85rw0kdvw0000gn/T/nvimNdff2D/0', { rpc = true }), 'nvim_
command', ':e ~/.zshrc')" --cmd "q" --headless

