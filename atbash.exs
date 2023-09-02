# https://edabit.com/challenge/MGALfBAXhXqqdFyqo

atbash = fn text when is_binary(text) ->
  alphabet = String.graphemes("abcdefghijklmnopqrstuvwxyz")

  text
  |> String.graphemes()
  |> Enum.map(fn c ->
    c_lower = String.downcase(c)
    downcased = c_lower != c
    idx = Enum.find_index(alphabet, &(&1 == c_lower))

    case idx do
      nil ->
        c

      _ ->
        r = Enum.at(alphabet, 25 - idx)

        case downcased do
          true -> String.upcase(r)
          false -> r
        end
    end
  end)
  |> Enum.join()
end

# Test case
Enum.each(
  [
    {"apple", "zkkov"},
    {"Hello, world!", "Svool, dliow!"},
    {"", ""}
  ],
  fn {test_case, expected} ->
    res = atbash.(test_case)

    IO.puts(
      Enum.join([
        String.pad_trailing("Case: #{test_case} -> #{expected}", 38),
        String.pad_trailing("Got: #{res}", 20),
        if res == expected do
          "(Correct!)"
        else
          "(Incorrect :/)"
        end
      ])
    )
  end
)
