# Background Jobs

This repository contains several implementations of background tasks in Ruby and Elixir.

# Ruby

From the `ruby` directory execute `bundle install`. To run example execute `ruby <filename>`.

**Implementations:**

+ `task_example.rb`
Implements background task processing with `Thread`

+ `task_queue_example.rb`
Implements background task processing with `Queue`

# Elixir

**Implementations:**

To run `*.exs` example execute `elixir --no-halt <filename>`. Otherwise move to mix project directory and follow readme instructions.

+ `task_example.exs`
Implements background task processing with `Task`

+ `supervised_task_example`
Implements background task processing with `Task.Supervisor`

+ `task_queue_example`
Implements background task processing with `GenServer`
