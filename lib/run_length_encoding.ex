defmodule RunLengthEncoding do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  require Logger

  defp encode_rec([], accu) do
    accu
  end

  defp encode_rec([h | t], [{h, count} | accu]) do
    encode_rec(t, [{h, count + 1} | accu])
  end

  defp encode_rec([h | t], [{old, count} | accu]) do
    encode_rec(t, [{h, 1} | [{old, count} | accu]])
  end

  defp encode_rec([h | t], []) do
    encode_rec(t, [{h, 1}])
  end

  defp rle_char({char, 1}, result) do
    char <> result
  end

  defp rle_char({char, count}, result) do
    "#{count}" <> char <> result
  end

  def assemble(tuples) do
    tuples |> Enum.reduce("", &rle_char/2)
  end

  def encode(string) do
    encode_rec(String.codepoints(string), []) |> assemble
  end

  def decode(string) do
    string
  end
end
