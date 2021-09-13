defmodule TaskQueueExample do
  @moduledoc false

  use Plug.Router

  require Logger

  alias TaskQueueExample.TaskQueue

  plug Plug.Logger
  plug :match
  plug :dispatch

  @workload 3..5

  get "/" do
    TaskQueue.push(&heavy_work/0)
    send_resp(conn, :ok, "")
  end

  defp heavy_work do
    timeout = Enum.random(@workload) * 1_000
    Process.sleep(timeout)
    Logger.info("done")
  end
end
