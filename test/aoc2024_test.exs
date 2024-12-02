defmodule Aoc2024.TestDays do
  use ExUnit.Case

  test "day 01 part 1" do
    assert Aoc2024.Day01Part1.run() == 1151792
  end

  test "day 01 part 2" do
    assert Aoc2024.Day01Part2.run() == 21790168
  end

  test "day 02 part 1" do
    assert Aoc2024.Day02Part1.run() == 299
  end

  test "day 02 part 2" do
    assert Aoc2024.Day02Part2.run() == 364
  end
end
