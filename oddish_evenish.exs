# https://edabit.com/challenge/r6TSNwkLZ2DgsoKiH

oddish_or_evenish = fn x when is_integer(x) ->
  x
  |> Integer.to_string()
  |> String.graphemes()
  |> Enum.map(&String.to_integer(&1))
  |> Enum.sum()
  |> then(
    &case rem(&1, 2) do
      0 -> :evenish
      1 -> :oddish
    end
  )
end

# Test cases
Enum.each(
  [
    {43, :oddish},
    {373, :oddish},
    {4433, :evenish},
    {2, :evenish},
    {22, :evenish}
  ],
  fn {test_case, expected} ->
    res = oddish_or_evenish.(test_case)
    IO.puts("Case: #{test_case} -> #{expected} (Got #{res})")
  end
)
