defmodule Cache do
  def init(table) do
    case Agent.start_link(fn -> %{} end) do
      {:ok, pid} ->
        Process.register(pid, table)
      _ -> raise "Failed to start link"
    end
  end

  def get(table, key) do
    Agent.get(table, &Map.get(&1, key))
  end

  def set(table, key, value) do
    Agent.update(table, &Map.put(&1, key, value), 100000)
  end
end
