defmodule RunLengthEncodingTest do
  use ExUnit.Case
  doctest RunLengthEncoding

  test "encode empty string" do
    assert RunLengthEncoding.encode("") === ""
  end

  test "encode single characters only are encoded without count" do
    assert RunLengthEncoding.encode("XYZ") === "XYZ"
  end

  test "encode string with no single characters" do
    assert RunLengthEncoding.encode("AABBBCCCC") == "2A3B4C"
  end

  test "encode single characters mixed with repeated characters" do
    assert RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") ===
             "12WB12W3B24WB"
  end

  test "encode multiple whitespace mixed in string" do
    assert RunLengthEncoding.encode("  hsqq qww  ") === "2 hs2q q2w2 "
  end

  test "encode lowercase characters" do
    assert RunLengthEncoding.encode("aabbbcccc") === "2a3b4c"
  end

  test "decode empty string" do
    assert RunLengthEncoding.decode("") === ""
  end

  test "decode single characters only" do
    assert RunLengthEncoding.decode("XYZ") === "XYZ"
  end

  @tag :pending
  test "decode string with no single characters" do
    assert RunLengthEncoding.decode("2A3B4C") == "AABBBCCCC"
  end

  @tag :pending
  test "decode single characters with repeated characters" do
    assert RunLengthEncoding.decode("12WB12W3B24WB") ===
             "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
  end

  @tag :pending
  test "decode multiple whitespace mixed in string" do
    assert RunLengthEncoding.decode("2 hs2q q2w2 ") === "  hsqq qww  "
  end

  @tag :pending
  test "decode lower case string" do
    assert RunLengthEncoding.decode("2a3b4c") === "aabbbcccc"
  end

  @tag :pending
  test "encode followed by decode gives original string" do
    original = "zzz ZZ  zZ"
    encoded = RunLengthEncoding.encode(original)
    assert RunLengthEncoding.decode(encoded) === original
  end
end
