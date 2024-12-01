defmodule Aoc2024.Day01Part1 do
  def run do
    File.read!("lib/day01/input01.txt")
    |> processInput()
  end

  defp processInput(input) do
    {first, second} = input
    |> String.split([" ", "\n"], trim: true)
    |> Enum.chunk_every(2)
    |> Enum.map(fn(x) -> List.to_tuple(x) end)
    |> Enum.map(fn{left, right} -> {String.to_integer(right), String.to_integer(left)} end)
    |> Enum.unzip()

    first = Enum.sort(first)
    second = Enum.sort(second)

    Enum.zip(first, second)
    |> Enum.map(fn{l, r} -> abs(l - r) end)
    |> Enum.sum()
  end
end
