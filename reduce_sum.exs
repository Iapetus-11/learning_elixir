sum = fn numbers -> Enum.reduce(numbers, fn (el, acc) -> el + acc end) end
sum.([1, 2, 3]) |> IO.inspect
