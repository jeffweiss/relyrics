defmodule Mike do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Joe, []),
      worker(Robert, [])
    ]

    opts = [strategy: :one_for_one, name: :mike_williams]

    supervise(children, opts)
  end	
end
