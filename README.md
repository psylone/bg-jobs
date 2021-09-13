# Background Jobs

This repository contains several implementations of background tasks in Ruby and Elixir.

# Ruby

Move into `ruby` directory and execute `bundle install`.

To run example execute `ruby <filename>`.

**Implementations:**

+ `task_example.rb`
Implements background task with `Thread`

+ `task_queue_example.rb`
Implements background task with `Queue`

# Elixir

**Implementations:**

+ `task_example.exs`
Implements background task with `Task`

+ `supervised_task_example.exs`
Implements background task with `Task.Supervisor`

+ `task_queue_example.exs`
Implements background task with `GenServer`
