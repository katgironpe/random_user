defmodule RandomUser.RandomTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  describe "one" do
    test "get one random user" do
      use_cassette "one_random_user" do
        assert RandomUser.Random.one.body["info"]["results"] == 1
      end
    end
  end

  describe "multiple" do
    test "get multiple random user" do
      use_cassette "multiple_random_users" do
        assert RandomUser.Random.multiple(10).body["info"]["results"] == 10
      end
    end
  end

  doctest RandomUser.Random
end
