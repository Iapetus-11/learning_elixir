defmodule Fibonacci do
  def calculate(x) when x == 0 do 0 end
  def calculate(x) when x <= 2 do 1 end
  def calculate(x) do calculate(x - 1) + calculate(x - 2) end

  def calculateFor(n, i \\ 1)
  def calculateFor(n, i) when i >= n do end
  def calculateFor(n, i) do
    calculate(i) |> IO.puts
    calculateFor(n, i + 1)
  end
end

IO.gets("Input N: ") |> String.slice(0..-2) |> String.to_integer |> Fibonacci.calculateFor
# Vs
# Fibonacci.calculateFor(String.to_integer(String.slice(IO.gets("Input N: "), 0..-2)))
