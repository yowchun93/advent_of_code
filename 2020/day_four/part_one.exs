defmodule PassportChecker do
  def parse_passports do
    valid_passports =
      lines("input04.txt")
      |> Enum.map(fn x -> extract_fields(x) end)
      |> Enum.map(fn x -> check_passport_validity(x) end)
      |> Enum.count(fn x -> x == true end)
  end

  defp lines(file) do
    File.read!(file)
    |> String.split(~r{\n\n}, trim: true)
  end

  defp extract_fields(passport) do
    passport
    |> String.split([" ", "\n"])
    |> Enum.map(fn x -> String.split(x, ":") |> Enum.at(0) end)
  end

  defp check_passport_validity(passport_fields) do
    passport_fields = MapSet.new(passport_fields)
    MapSet.subset?(required_password_fields, passport_fields)
  end

  defp required_password_fields do
    # :cid is optional field
    MapSet.new(["byr", "ecl", "eyr", "hcl", "hgt", "iyr", "pid"])
  end

  # Solution found online
  # @required MapSet.new(["byr", "ecl", "eyr", "hcl", "hgt", "iyr", "pid"])

  # def parse_passports do
  #   File.read!("input04.txt")
  #   |> String.trim()
  #   |> String.split("\n\n")
  #   |> Enum.map(fn passport ->
  #     passport
  #     |> String.split([" ", "\n"])
  #     |> Enum.map(&String.split(&1, ":"))
  #     |> Enum.into(MapSet.new(), fn [k, _] -> k end)
  #   end)
  #   |> Enum.count(&MapSet.subset?(@required, &1))
  # end
end

PassportChecker.parse_passports() |> IO.puts

# all fields present: Valid
# ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
# byr:1937 iyr:2017 cid:147 hgt:183cm