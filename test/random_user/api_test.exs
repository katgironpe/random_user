defmodule RandomUser.APITest do
  use ExUnit.Case

  describe "RandomUser.API.base_url" do
    test "returns API url" do
      assert RandomUser.API.base_url == "http://api.randomuser.me" |> to_char_list
    end
  end

  doctest RandomUser.API
end
