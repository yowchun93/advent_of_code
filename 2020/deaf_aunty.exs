defmodule DeafAunty do
  def run do
    read_input(0)
  end

  # main loop
  defp read_input(consecutive_byes) when consecutive_byes < 3 do
    IO.read(:stdio, :line)
    |> String.trim
    |> talk_to_aunty(consecutive_byes)
  end

  defp read_input(consecutive_byes) when consecutive_byes >= 3 do
    say_goodbye()
  end

  defp talk_to_aunty(sentence, consecutive_byes) do
    if sentence == "BYE" do
      IO.puts "What!? You want to leave????"
      read_input(consecutive_byes + 1)
    else
      IO.puts sentence
      read_input(consecutive_byes)
    end
  end

  defp say_goodbye do
    IO.puts("Okay BYE!")
  end
end

DeafAunty.run()