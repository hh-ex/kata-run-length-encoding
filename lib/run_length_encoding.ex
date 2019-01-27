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
    |> encode_rec(0)
  end

  defp encode_rec(<<a::utf8, b::utf8>> <> rest, count) when a == b do
    encode_rec(<<b::utf8>> <> rest, count + 1)
  end

  defp encode_rec(<<a::utf8>> <> rest, count) when count == 0 do
    <<a::utf8>> <> encode_rec(rest, 0)
  end

  defp encode_rec(<<a::utf8>> <> rest, count) do
    to_string(count + 1) <> <<a::utf8>> <> encode_rec(rest, 0)
  end

  defp encode_rec(rest, _), do: rest

  def decode(string) do
    string
    |> decode_rec(0)
  end

  defguard is_digit(char) when ?0 <= char and char <= ?9

  defp decode_rec(<<a::utf8>> <> rest, times) when is_digit(a) do
    decode_rec(rest, times * 10 + String.to_integer(<<a>>))
  end

  defp decode_rec(<<a::utf8>> <> rest, 0) do
    <<a>> <> decode_rec(rest, 0)
  end

  defp decode_rec(<<a::utf8>> <> rest, times) do
    String.duplicate(<<a>>, times) <> decode_rec(rest, 0)
  end

  defp decode_rec(rest, _), do: rest
end
