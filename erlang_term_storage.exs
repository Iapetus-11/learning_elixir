:ets.new(:my_table, [:set, :protected, :named_table])

:ets.insert(:my_table, {"key", "value"})
:ets.insert(:my_table, {"some", "thing"})
:ets.insert(:my_table, {"deez", "nutz"})

:ets.lookup(:my_table, "key") |> Enum.at(0) |> elem(1) |> IO.puts
