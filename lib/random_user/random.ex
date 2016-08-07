defmodule RandomUser.Random do
  alias RandomUser.API

  @doc """
  Returns one random user.

  ## Examples

  iex> RandomUser.Random.one
  """

  def one do
    API.get(RandomUser.config(:one_random_user_api_url))
  end

  @doc """
  Returns multiple random users. This is efficient compared to just getting one random user.

  ## Examples

  iex> RandomUser.Random.multiple(50)
  """

  def multiple(n) do
    url = to_string(RandomUser.config(:multiple_random_user_api_url)) <> to_string(n)
    API.get(url)
  end
end
