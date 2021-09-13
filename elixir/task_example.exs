Mix.install([
  {:plug_cowboy, "~> 2.5.2"}
])

require Logger

defmodule TaskExample do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  @workload 3..5

  get "/" do
    Task.start_link(&heavy_work/0)
    send_resp(conn, :ok, "")
  end

  defp heavy_work do
    timeout = Enum.random(@workload) * 1_000
    Process.sleep(timeout)
    Logger.info("done")
  end
end

Plug.Cowboy.http(TaskExample, [])
Logger.info("server started")
