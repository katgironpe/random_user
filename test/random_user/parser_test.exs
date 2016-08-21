defmodule RandomUser.ParserTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  describe "RandomUser.Parser.parse/1" do
    test "converts string keys to atoms" do
      results = %{ "one" => "one", "two" => "two" }

      assert results |> RandomUser.Parser.parse == %{one: "one", two: "two"}
    end
  end

  describe "RandomUser.Parser.results/1" do
    test "retrieves results for one user" do
      use_cassette "one_random_user" do
        user = RandomUser.Random.one |> RandomUser.Parser.results
        assert user["picture"]["large"] =~ ~r/https:\/\/randomuser.me\/api\/portraits/
        assert user["picture"]["medium"] =~ ~r/https:\/\/randomuser.me\/api\/portraits\/med/
      end
    end

    test "retrieves results for multiple users" do
      use_cassette "multiple_random_users" do
        user = RandomUser.Random.multiple(10) |> RandomUser.Parser.results |> List.first
        assert user["picture"]["large"] =~ ~r/https:\/\/randomuser.me\/api\/portraits/
        assert user["picture"]["medium"] =~ ~r/https:\/\/randomuser.me\/api\/portraits\/med/
      end
    end
  end

  doctest RandomUser.Parser
end
