defmodule RunLengthEncoding do
  require IEx

  def encode(string) when string == "" do
    ""
  end

  def encode(string) do
    %{"head" => head, "tail" => tail} = Regex.named_captures(~r/(?<head>#{String.at(string,0)}+)(?<tail>.*)/, string)
    if String.length(head) == 1 do
      "#{head}#{encode(tail)}"
    else
      "#{String.length(head)}#{String.at(head, 0)}#{encode(tail)}"
    end
  end
end
