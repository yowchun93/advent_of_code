# https://adventofcode.com/2020/day/1

defmodule ExpenseReport do
  def execute(list) do
    {a, b} =
    list
    |> find_two_numbers(2020)

    IO.puts("#{a} x #{b} = #{a * b}")
  end

  def find_two_numbers([current | rest], sum) do
    target = sum - current

    if target in rest do
      {current, target}
    else
      find_two_numbers(rest, sum)
    end
  end

  # find 3 entries which add to 2020
  def find_three_numbers([current, rest], sum) do
    target = sum - current

    two_entries = find_two_numbers(rest, target)
    if two_entries do
      [current | two_entries]
    else
      find_three_numbers(rest, sum)
    end
  end
end

# [1721, 979, 366, 299, 675, 1456]
ExpenseReport.execute([1721, 979, 366, 299, 675, 1456])