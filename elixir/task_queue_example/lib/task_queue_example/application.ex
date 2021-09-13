defmodule TaskQueueExample.Application do
  @moduledoc false

  use Application

  alias TaskQueueExample.TaskQueue

  @impl true
  def start(_type, _args) do
    children = [
      {TaskQueue, name: TaskQueue},
      {Plug.Cowboy, scheme: :http, plug: TaskQueueExample}
    ]

    opts = [strategy: :one_for_one, name: TaskQueueExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
