defmodule RandomUser.RandomTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  describe "RandomUser.RandomTest.one" do
    test "get one random user" do
      use_cassette "one_random_user" do
        assert RandomUser.Random.one.body["info"]["results"] == 1
      end
    end

    test "get one random female user" do
      use_cassette "female_one_random_user" do
        res = RandomUser.Random.one(%{gender: "female"}).body
        first_result = res["results"] |> List.first
        assert first_result["gender"] == "female"
      end
    end

    test "get one random British female user" do
      use_cassette "gb_female_one_random_user" do
        res = RandomUser.Random.one(%{gender: "female", nat: "gb"}).body
        first_result = res["results"] |> List.first
        assert first_result["gender"] == "female"
        assert first_result["nat"] == "GB"
      end
    end

    test "get seeds which always returns Becky Sims" do
      use_cassette "seeds_one_random_user" do
        res = RandomUser.Random.one(%{seed: "foobar"}).body
        first_result = res["results"] |> List.first
        assert first_result["gender"] == "female"
        assert first_result["name"]["first"] == "becky"
      end
    end
  end

  describe "RandomUser.RandomTest.multiple" do
    test "get multiple random users" do
      use_cassette "multiple_random_users" do
        assert RandomUser.Random.multiple(10).body["info"]["results"] == 10
      end
    end

    test "get multiple random female users" do
      use_cassette "female_multiple_random_users" do
        req = RandomUser.Random.multiple(2, %{gender: "female"})
        res = req.body
        first_result = res["results"] |> List.first
        last_result = res["results"] |> List.last
        assert req.body["info"]["results"] == 2
        assert first_result["gender"] == "female"
        assert last_result["gender"] == "female"
      end
    end

    test "get multiple random British female users" do
      use_cassette "gb_female_multiple_random_users" do
        req = RandomUser.Random.multiple(2, %{gender: "female", nat: "gb"})
        res = req.body
        first_result = res["results"] |> List.first
        last_result = res["results"] |> List.last
        assert req.body["info"]["results"] == 2
        assert first_result["gender"] == "female"
        assert last_result["gender"] == "female"
        assert first_result["nat"] == "GB"
        assert last_result["nat"] == "GB"
      end
    end
  end

  doctest RandomUser.Random
end
