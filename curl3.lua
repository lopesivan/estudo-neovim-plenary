-- programa em lua
local curl = require "plenary.curl"
local file = "https://media2.giphy.com/media/bEMcuOG3hXVnihvB7x/giphy.gif"

local loc = "/tmp/giphy2.gif"

local res = curl.get(file, { output = loc })
print(vim.inspect.inspect(res))
