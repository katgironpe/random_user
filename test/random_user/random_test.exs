defmodule RandomUser.RandomTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  describe "one" do
    test "get one random user with ibrowse" do
      use_cassette "one_random_user" do
        assert RandomUser.Random.one.body["info"]["results"] == 1
      end
    end

  end

  doctest RandomUser.Random
end
