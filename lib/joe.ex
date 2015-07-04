defmodule Joe do
  def start_link do
    Task.start_link(__MODULE__, :noop, [])
  end

  def noop do
  end

end
