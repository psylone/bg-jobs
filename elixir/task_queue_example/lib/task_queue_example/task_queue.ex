defmodule TaskQueueExample.TaskQueue do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:push, value}, state) do
    value.()
    {:noreply, state}
  end
end
