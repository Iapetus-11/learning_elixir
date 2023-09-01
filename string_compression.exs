# Modified from https://leetcode.com/problems/string-compression/

string_compress = fn string when is_binary(string) ->
  string
  |> String.graphemes()
  |> then(&(&1 ++ [nil]))
  |> Enum.reduce(%{out: "", cur: nil, cnt: 0}, fn el, acc ->
    cond do
      el == acc.cur ->
        Map.replace(acc, :cnt, acc.cnt + 1)

      true ->
        %{
          out:
            acc.out <>
              case acc.cnt do
                0 -> ""
                1 -> acc.cur
                _ -> "#{acc.cnt}#{acc.cur}"
              end,
          cur: el,
          cnt: 1
        }
    end
  end)
  |> then(& &1.out)
end

Enum.each(
  [
    {"aaaabccbbbaaad", "4ab2c3b3ad"},
    {"aaaaaaaa", "8a"},
    {"", ""}
  ],
  fn {test_string, expected} ->
    res = string_compress.(test_string)

    IO.puts(
      String.pad_trailing("Case #{expected} -> #{expected} :", 45) <>
        case res do
          ^expected -> "Correct!"
          _ -> "Incorrect :/ (Got: #{res})"
        end
    )
  end
)
