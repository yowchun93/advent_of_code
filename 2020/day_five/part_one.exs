# I like this solution
# https://github.com/JEG2/advent_of_code_2020/blob/main/day_05/boarding.exs
# this is kinda like Binary search algorithm
# https://elixirforum.com/t/advent-of-code-2020-day-5/35997/29

defmodule Boarding do
  # def read_boarding_passes do
  #   "input05.txt"
  #   |> File.read!()
  #   |> String.split(~r{\n}, trim: true)
  #   |> locate_seats()
  # end

  # defp locate_seats(seats) do
  #   seats
  #   |> Enum.map(fn x -> locate(x) end)
  # end

  # defp locate(char, location \\ {{0, 127}, {0, 7}})
  # defp locate("", location), do: to_id(location)
  # defp locate("F" <> char, {row, col}) do
  #   locate(char, {down(row), col})
  # end
  # defp locate("B" <> char, {row, col}) do
  #   locate(char, {up(row), col})
  # end
  # defp locate("L" <> char, {row, col}) do
  #   locate(char, {row, down(col)})
  # end
  # defp locate("R" <> char, {row, col}) do
  #   locate(char, {row, up(col)})
  # end

  # defp down({min, max}) when min + 1 == max, do: min
  # defp down({min, max}), do: {min, mid_point(min, max)}

  # defp up({min, max}) when min + 1 == max, do: max
  # defp up({min, max}), do: {mid_point(min, max) + 1, max}

  # defp mid_point(min, max), do

  # end

  # defp to_id({row, col}) do
  # end

  def run do
    File.read!("input05.txt")
    |> String.split(~r{\n}, trim: true)
    |> Enum.map(fn x -> seat_id(x) end)
    |> Enum.max()
  end

  defp seat_id(boarding_pass) do
    passes = boarding_pass |> String.graphemes()

    {rmin, _rmax, cmin, _cmax} =
      Enum.reduce(passes, {0, 127, 0, 7}, fn char, {rmin, rmax, cmin, cmax} ->
        ri = floor((rmin + rmax) / 2)
        ci = floor((cmin + cmax) / 2)

        case char do
          "F" -> {rmin, ri, cmin, cmax}
          "B" -> {ri + 1, rmax, cmin, cmax}
          "L" -> {rmin, rmax, cmin, ci}
          "R" -> {rmin, rmax, ci + 1, cmax}
         end
      end)
    rmin * 8 + cmin
  end
end

Boarding.run() |> IO.inspect