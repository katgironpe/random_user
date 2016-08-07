defmodule RandomUser.ParserTest do
  use ExUnit.Case

  test ".parse converts string keys to atoms" do
    results = %{ "one" => "one", "two" => "two" }

    assert RandomUser.Parser.parse(results) == %{one: "one", two: "two"}
  end

  doctest RandomUser.Parser
end
