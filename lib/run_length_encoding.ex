defmodule RunLengthEncoding do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  require Logger

  defp encode_rec([], accu), do: accu
  defp encode_rec([h | t], [{h, count} | accu]), do: encode_rec(t, [{h, count + 1} | accu])
  defp encode_rec([h | t], [{old, count} | accu]), do: encode_rec(t, [{h, 1} | [{old, count} | accu]])
  defp encode_rec([h | t], []), do: encode_rec(t, [{h, 1}])

  defp rle_char({char, 1}, result), do: char <> result
  defp rle_char({char, count}, result), do: "#{count}" <> char <> result

  def assemble(tuples) do
    tuples
    |> Enum.reduce("", &rle_char/2)
  end

  def encode(string) do
    encode_rec(String.codepoints(string), [])
    |> assemble
  end

  @digits 0..9
          |> Enum.map(&("#{&1}"))

  defp decode_rec([], accu), do: accu
  defp decode_rec([h | t], {number, accu}) when not (h in @digits), do: decode_rec(t, {[], [{number, h} | accu]})
  defp decode_rec([h | t], {number, accu}), do: decode_rec(t, {[h | number], accu})


  defp digits_to_int([]), do: 1
  defp digits_to_int(digits),
       do: digits
           |> Enum.join("")
           |> String.to_integer

  defp rldecode_char({reverse_digits, char}, result) do
    String.duplicate(char, digits_to_int(reverse_digits |> Enum.reverse)) <> result
  end

  def decode_assemble({_, chars}) do
    chars
    |> Enum.reduce("", &rldecode_char/2)
  end

  def decode(string) do
    decode_rec(String.codepoints(string), {[], []})
    |> decode_assemble
  end
end
