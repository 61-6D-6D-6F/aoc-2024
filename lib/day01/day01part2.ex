defmodule Aoc2024.Day01Part2 do
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

    second
      |>Enum.map(fn(val) ->
      val * Map.get(Enum.frequencies(first), val, 0)
    end)
    |> Enum.sum()
  end
end
