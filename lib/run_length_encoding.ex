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
    |> String.split("", trim: true)
    |> Kernel.++([:sentinel])
    |> Enum.reduce({0, "", ""}, fn char, {count, current_char, res} ->
      case char do
        :sentinel when count == 0 -> ""
        :sentinel when count == 1 -> "#{res}#{current_char}"
        :sentinel when count > 1 -> "#{res}#{count}#{current_char}"

        ^current_char -> {count + 1, current_char, res}

        new_char when count == 0 -> {1, new_char, res}
        new_char when count == 1 -> {1, new_char, "#{res}#{current_char}"}
        new_char when count > 1 -> {1, new_char, "#{res}#{count}#{current_char}"}
      end
    end)
  end

  def decode(string) do
    string
    |> String.split("", trim: true)
    |> decode_recursive("", "")
  end

  def decode_recursive([], _, res) do
    res
  end

  def decode_recursive([char | rest], count_string, res) do
    case Integer.parse(char) do
      {_number, _} -> 
        decode_recursive(rest, count_string <> char, res)

      :error -> 
        count = if count_string == "", do: 1, else: String.to_integer(count_string)
        decode_recursive(rest, "", res <> String.duplicate(char, count))
    end
  end
end
