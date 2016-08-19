defmodule RandomUser.ParserTest do
  use ExUnit.Case

  describe "parse" do
    test "converts string keys to atoms" do
      results = %{ "one" => "one", "two" => "two" }

      assert RandomUser.Parser.parse(results) == %{one: "one", two: "two"}
    end
  end

  doctest RandomUser.Parser
end
