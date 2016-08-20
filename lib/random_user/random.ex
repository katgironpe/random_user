defmodule RandomUser.Random do
  alias RandomUser.API

  @doc """
  Returns one random user.

  ## Examples

      RandomUser.Random.one
  """

  def one(options \\ %{}) do
    query = URI.encode_query(options)
    url = RandomUser.config(:one_random_user_api_url) |> to_string
    url = if map_size(options) > 0, do: "#{url}?#{query}", else: url
    API.get(url)
  end

  @doc """
  Returns multiple random users. This is efficient compared to just getting one random user.

  ## Examples

      # Returns 50 users
      RandomUser.Random.multiple(50)

      # Returns 50 female users
      RandomUser.Random.multiple(50, %{ gender: "female" })
  """

  def multiple(n, options \\ %{}) do
    query = URI.encode_query(options)
    url = to_string(RandomUser.config(:multiple_random_user_api_url)) <> to_string(n)
    url = if map_size(options) > 0, do: "#{url}&#{query}", else: url
    API.get(url)
  end
end
