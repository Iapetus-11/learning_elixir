# https://en.wikipedia.org/wiki/Collatz_conjecture

defmodule Collatz do
  def step(n) when is_integer(n) do
    cond do
      Integer.mod(n, 2) == 0 ->
        Integer.floor_div(n, 2)
      true ->
        n * 3 + 1
    end
  end

  def calculate(n, out \\ []) when is_integer(n) and is_list(out) do
    case n do
      1 -> out ++ [1]
      _ ->
        c = step(n)
        calculate(c, out ++ [n])
    end
  end
end

Enum.each([
  {10, [10, 5, 16, 8, 4, 2, 1]},
  {32, [32, 16, 8, 4, 2, 1]},
  {85, [85, 256, 128, 64, 32, 16, 8, 4, 2, 1]}
], fn {n, expected_out} ->
  out = Collatz.calculate(n)

  IO.write("n:#{n} ")

  cond do
    out == expected_out ->
      IO.puts("Correct!")
    true ->
      IO.puts("Incorrect :/ (got #{out})")
  end
end)
