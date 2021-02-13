# check number of valid passwords
defmodule PasswordChecker do
  def run(filename) do
    lines(filename)
    |> Enum.map(fn x -> to_password_and_policy(x) end)
    |> Enum.map(fn x -> check_validity_2(x) end)
    |> Enum.count(fn x -> x == true end)
  end

  defp to_password_and_policy(line) do
    [_, from, to, letter, password] = Regex.run(~r{(\d+)-(\d+) ([a-z]): ([a-z]+)}, line)
    {String.to_integer(from), String.to_integer(to), letter, password}
  end

  def check_validity({from, to, letter, password}) do
    occurances = password
    |> String.graphemes()
    |> Enum.count(fn x -> x == letter end)

    occurances >= from and occurances <= to
  end

  # at exactly one position
  def check_validity_2({pos1, pos2, letter, password}) do
    String.at(password, pos1 - 1) == letter && String.at(password, pos2 - 1) != letter ||
    String.at(password, pos1 - 1) != letter && String.at(password, pos2 - 1) == letter
  end

  defp lines(file) do
    File.read!(file)
    |> String.split(~r{\n}, trim: true)
  end
end

PasswordChecker.run("inputs/input02.txt") |> IO.inspect