defmodule RandomUser do
  @moduledoc """
  RandomUser is a Random User Generator API client for Elixir applications.
  If you want to learn more about how  RandomUser works internally, take a look
  at:

  - `RandomUser.API`
  - `RandomUser.Random`
  """

  def config(key) do
    Application.get_env(:random_user, key)
  end
end
