defmodule RandomUser.API do
  use HTTPotion.Base

  @moduledoc """
     API is an HTTPotion wrapper.
  """

  def base_url do
    :api_url |> RandomUser.config || "http://api.randomuser.me" |> to_char_list
  end

  def process_url(url) do
    url
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
