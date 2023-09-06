send(self(), {:tp, "some thing"})

receive do
  {:sus, _} -> IO.puts("This should never run woweee")
  {:tp, value} -> IO.puts(value)
end

send(self(), %{message: "Can I send anything?"})

receive do
  %{message: message} -> IO.puts("sus: " <> message)
end

for n <- 0..3 do
  send(self(), {:x, n})
end

for _ <- 0..3 do
  receive do
    {:x, value} -> IO.puts(value)
  end
end
