defmodule Aoc2024.Day02Part2 do
  def run do
    File.stream!("lib/day02/input02.txt")
    |> Enum.map(&processLine/1)
    |> Enum.count(fn(x) -> x == true end)
  end

  defp processLine(line) do
    line = line
    |> String.split([" ", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)

    line = Enum.map(0..(length(line) - 1), &List.delete_at(line, &1))

    Enum.any?(line, fn(variation) ->
      with true <- variation == Enum.sort(variation) or variation == Enum.sort(variation, :desc) do
        variation
        |> Enum.chunk_every(2, 1, :discard)
        |> Enum.all?(fn[l, r] -> abs(l - r) in 1..3 end)
      else _ -> false
      end
    end)
  end
end
