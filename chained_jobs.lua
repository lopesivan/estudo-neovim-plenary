local Job = require "plenary.job"

local function chained_jobs()
  local results = {}

  local first_job = Job:new {
    command = "env",
    env = { ["a"] = "1" },
    on_stdout = function(_, line)
      print "first job"
      table.insert(results, line)
    end,
  }

  local second_job = Job:new {
    command = "env",
    env = { ["b"] = "2" },
    on_stdout = function(_, line)
      print "second job"
      table.insert(results, line)
    end,
  }

  local third_job = Job:new {
    command = "echo",
    args = { "-e", "hello world" },
    on_stdout = function(_, line)
      print "third job"
      table.insert(results, line)
    end,
  }

  local fourth_job = Job:new {
    command = "env",
    env = { ["c"] = "3" },
    on_stdout = function(_, line)
      print "fourth job"
      table.insert(results, line)
    end,
  }

  first_job:and_then(second_job)
  second_job:and_then(third_job)
  third_job:and_then(fourth_job)

  first_job:sync()
  second_job:wait()
  third_job:wait()
  fourth_job:wait()

  print(vim.inspect.inspect(results))
end

chained_jobs()