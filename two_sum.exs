# https://leetcode.com/problems/two-sum/
# Modififed to have cases which should have multiple solutions to get the "target"

two_sum = fn nums, target when is_list(nums) and is_integer(target) ->
  nums = MapSet.new(nums)

  Enum.map(nums, fn el ->
    cond do
      target - el == el -> nil
      (target - el) in nums -> MapSet.new([el, target - el])
      true -> nil
    end
  end)
  |> Enum.filter(&(not is_nil(&1)))
  |> MapSet.new()
end

# Test cases
Enum.each(
  [
    {[1, 2, 3, 4], 4, [[1, 3]]},
    {[1, 2, 3, 4, 5, 6], 6, [[2, 4], [1, 5]]},
    {[-2, -1, 0, 1, 2, 3, 4], 2, [[-2, 4], [-1, 3], [0, 2]]},
  ],
  fn {test_nums, test_target, expected} ->
    expected_set = Enum.map(expected, &MapSet.new(&1)) |> MapSet.new()
    res = two_sum.(test_nums, test_target)

    if not MapSet.equal?(expected_set, res) do
      IO.write("Unexpected answer, got: ")
      IO.inspect(res)
    end

    IO.write(
      "Case (#{cond do
        MapSet.equal?(res, expected_set) -> "Correct!"
        true -> "Incorrect :/"
      end}): "
    )

    IO.inspect(expected)
  end
)
