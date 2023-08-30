defmodule Cache do
  def init(table) do
    :ets.new(table, [:set, :private, :named_table])
  end

  def get(table, key) do
    lookup = :ets.lookup(table, key)
    cond do
      lookup == [] -> nil
      length(lookup) != 1 -> raise "Lookup didn't return exactly one result"
      true -> lookup |> hd |> elem(1)
    end
  end

  def set(table, key, value) do
    :ets.insert(table, {key, value})
  end
end
