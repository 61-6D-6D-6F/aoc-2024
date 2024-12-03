defmodule Aoc2024.Day03Part2 do
  def run do
    File.read!("lib/day03/input03.txt")
    |> processInput()
  end

  defp processInput(input) do
    input =
    Regex.scan(~r/mul\([0-9]+,[0-9]+\)|don\'t\(\)|do\(\)/, input)
    |> Enum.map(&(Enum.at(&1, 0)))

    {_, input} = input
    |> Enum.reduce({:do, []}, fn(x, acc) ->
      case {x, acc} do
        {"don't()", _} -> {:dont, elem(acc, 1)}
        {"do()", _} -> {:do, elem(acc, 1)}
        {_, {:dont, _}} -> {:dont, elem(acc, 1)}
        _ -> {:do, [x | elem(acc, 1)]}
      end
    end)

    input
    |> Enum.map(fn(x) ->
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
