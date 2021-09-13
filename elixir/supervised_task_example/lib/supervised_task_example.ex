defmodule SupervisedTaskExample do
  @moduledoc false

  use Plug.Router

  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  @workload 3..5

  get "/" do
    Task.Supervisor.start_child(
      TaskSup,
      &heavy_work/0,
      restart: :transient
    )

    send_resp(conn, :ok, "")
  end

  defp heavy_work do
    timeout = Enum.random(@workload) * 1_000
    Process.sleep(timeout)
    Logger.info("done")
  end
end
