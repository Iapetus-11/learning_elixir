Code.require_file("ets_cache.exs")
# Code.require_file("agent_cache.exs")

defmodule Fibonacci do
  @cache :fibo

  def calculate(x) when x == 0 do 0 end
  def calculate(x) when x <= 2 do 1 end
  def calculate(x) do
    cached = Cache.get(@cache, x)
    if cached != nil do
      cached
    end

    result = calculate(x - 1) + calculate(x - 2)
    Cache.set(@cache, x, result)
    result
  end

  def calculate_for(n, i \\ 1)
  def calculate_for(n, i) when i >= n do end
  def calculate_for(n, i) do
    calculate(i) |> IO.puts
    calculate_for(n, i + 1)
  end
end

Cache.init(:fibo)

IO.gets("Input N: ") |> String.slice(0..-2) |> String.to_integer |> Fibonacci.calculate_for
