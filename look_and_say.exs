look_and_say = fn nstr when is_binary(nstr) ->
    nstr
    |> String.to_charlist()
    |> then(&(&1 ++ [nil]))
    |> Enum.reduce(%{out: "", cnt: 0, cur: nil}, fn el, acc ->
      cond do
        is_nil(acc.cur) -> %{out: acc.out, cnt: 1, cur: el}
        acc.cur != el -> %{out: acc.out <> "#{acc.cnt}#{List.to_string([acc.cur])}", cnt: 1, cur: el}
        true -> %{out: acc.out, cnt: acc.cnt + 1, cur: el}
      end
    end)
    |> then(&(&1.out))
end

look_and_say = fn n when is_integer(n) ->
  Enum.reduce(0..n, %{out: [], las: "1"}, fn el, acc ->
    cal = look_and_say.(acc.las)
    %{out: acc.out ++ [cal], las: cal}
  end).out
end

IO.gets("N: ") |> String.slice(0..-2) |> String.to_integer |> look_and_say.() |> IO.inspect
