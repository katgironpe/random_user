defmodule RandomUser.Random do
  alias RandomUser.API

  @doc """
  Returns one random user

  ## Examples

  iex> RandomUser.Random.one
  """

  def one do
    API.get("api/")
  end
end
