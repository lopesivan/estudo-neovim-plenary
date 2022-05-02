-- programa em lua
local curl = require "plenary.curl"
local res = curl.post(
"https://postman-echo.com/post",
{
  body = "Hello World!",
})

print(vim.inspect.inspect(res))
