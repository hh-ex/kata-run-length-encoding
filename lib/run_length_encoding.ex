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
    |> String.codepoints()
    |> Stream.chunk_by(& &1)
    |> Stream.map(&map_chunk/1)
    |> Enum.join()
  end

  defp map_chunk([letter]), do: letter
  defp map_chunk([letter | _rest] = arr), do: "#{length(arr)}#{letter}"

  def decode(string) do
    string
    |> String.codepoints()
    |> Enum.reduce({[], nil}, fn char, {str, times} ->
      case Integer.parse(char) do
        :error -> {[String.duplicate(char, times || 1) | str], nil}
        {count, _} -> {str, if(times, do: times * 10 + count, else: count)}
      end
    end)
    |> elem(0)
    |> Enum.reverse()
    |> Enum.join()
  end
end
