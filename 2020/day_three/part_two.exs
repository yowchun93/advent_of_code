defmodule PathFinder do
  def run(filename) do
    input = read_input(filename)
    traverse(input, 1, 1) * traverse(input,3,1) * traverse(input,5,1) * traverse(input,7,1) * traverse(input,1,2)
  end

  def traverse(input, dx, dy) do
    {x, trees} = input
      |> Enum.take_every(dy)
      |> Enum.reduce({0, 0}, fn row, {x, trees} ->
        # stream.cycle to prevent out of bounds list
        # proper solution should reset x to 0 if more than length of row
        trees = case Stream.cycle(row) |> Enum.at(x) do
          ?# -> trees + 1
          ?. -> trees
        end
        {x + dx, trees}
      end)
    trees
  end

  def read_input(path) do
    File.read!(path)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_charlist/1)
  end
end

PathFinder.run("input03.txt") |> IO.puts