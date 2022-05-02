-- programa em lua
local curl = require "plenary.curl"
local res = curl.get(
  "https://jsonplaceholder.typicode.com/todos",
  {
  accept = "application/json",
  }
)

print(vim.inspect.inspect(res))
