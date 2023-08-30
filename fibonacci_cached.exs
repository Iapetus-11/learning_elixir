Code.require_file("ets_cache.exs")

Cache.init(:fibo)

defmodule Fibonacci do
  def calculate(x) when x == 0 do 0 end
  def calculate(x) when x <= 2 do 1 end
  def calculate(x) do
    cached = Cache.get(:fibo, x)
    if cached != nil do
      cached
    end

    result = calculate(x - 1) + calculate(x - 2)
    Cache.set(:fibo, x, result)
    result
  end

  def calculate_for(n, i \\ 1)
  def calculate_for(n, i) when i >= n do end
  def calculate_for(n, i) do
    calculate(i) |> IO.puts
    calculate_for(n, i + 1)
  end
end

IO.gets("Input N: ") |> String.slice(0..-2) |> String.to_integer |> Fibonacci.calculate_for
