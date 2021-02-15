# traversal
defmodule PathFinder do
  def read_and_parse_map(file) do
    {x, y, trees} =
      file
      |> read_input
      |> Enum.reduce({0, 0, 0}, fn row, {x, y, trees} ->
        # stream.cycle to prevent out of bounds list
        trees = case Stream.cycle(row) |> Enum.at(x) do
          ?# -> trees + 1
          ?. -> trees
        end
        {x + 3, y + 1, trees}
      end)
  end

  def read_input(path) do
    File.read!(path)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_charlist/1)
  end
end

{x,y,trees} = PathFinder.read_and_parse_map("input03.txt")
IO.puts trees