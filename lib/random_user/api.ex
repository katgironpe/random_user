defmodule RandomUser.API do
  use HTTPotion.Base

  def process_url(url) do
    "https://randomuser.me/" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
