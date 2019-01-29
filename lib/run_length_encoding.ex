defmodule RunLengthEncoding do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  require Logger

  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce({"", 0, ""}, fn char, {current_char, n, current_string} ->
      cond do
        char == current_char -> {current_char, n + 1, current_string}
        n <= 1 -> {char, 1, current_string <> current_char}
        true -> {char, 1, current_string <> "#{n}#{current_char}"}
      end
    end)
    |> handle_tuple()
  end

  defp handle_tuple({_char, 0, string}), do: string
  defp handle_tuple({char, 1, string}), do: string <> char
  defp handle_tuple({char, n, string}), do: string <> "#{n}#{char}"

  def decode(_string) do
    :ok
  end
end
