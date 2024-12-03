defmodule Aoc2024.Day03Part1 do
  def run do
    File.read!("lib/day03/input03.txt")
    |> processInput()
  end

  defp processInput(input) do
    Regex.scan(~r/mul\([0-9]+,[0-9]+\)/, input)
      |> Enum.map(fn[x] ->
        Regex.run(~r/[0-9]+,[0-9]+/, x, capture: :first)
        |> Enum.at(0)
        |> String.split(",")
        |> Enum.reduce(fn(x, acc) ->
          String.to_integer(x) * String.to_integer(acc)
      end)
    end)
    |> Enum.sum()
  end
end
