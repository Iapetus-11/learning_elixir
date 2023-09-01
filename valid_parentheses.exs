# https://leetcode.com/problems/valid-parentheses/

defmodule Brackets do
  @brackets %{
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }

  def valid?(brackets) when is_binary(brackets) do
    brackets
    |> String.graphemes()
    |> Enum.reduce_while([], fn el, acc ->
      cond do
        Map.has_key?(@brackets, el) -> {:cont, [el | acc]}
        acc == [] -> {:halt, nil}
        Map.get(@brackets, hd(acc)) == el -> {:cont, Enum.slice(acc, 1..-1)}
        true -> {:cont, acc}
      end
    end)
    |> then(&(&1 != nil and length(&1) == 0))
  end
end

# Test cases
Enum.each(
  [
    {"()[]{}", true},
    {"(([])){[()][]}", true},
    {"())[]{}", false},
    {"[(])", false},
    {"(", false},
    {"((", false},
    {"))", false}
  ],
  fn {test_case, valid} ->
    res = Brackets.valid?(test_case)

    cond do
      res == valid and res == true -> "Valid (correct)"
      res == valid and res == false -> "Invalid (correct)"
      true -> "WRONG (got #{res} expected #{valid})"
    end
    |> then(&(String.pad_trailing("Case: \"#{test_case}\"", 24) <> &1))
    |> IO.puts()
  end
)
