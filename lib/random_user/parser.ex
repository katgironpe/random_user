defmodule RandomUser.Parser do
  @moduledoc """
     Parser helps you format the JSON output and easily access the data.

  ## Examples

      res = RandomUser.Random.one |> RandomUser.Parser.results |> RandomUser.Parser.parse

  """

  @doc """
  This will convert map keys to atoms and allow you to access keys with dot notation

  ## Examples

      res = RandomUser.Random.one |> RandomUser.Parser.results |> RandomUser.Parser.parse
      res.gender
      res.picture["large"]
  """

  def parse(results) do
    for {key, val} <- results, into: %{}, do: {String.to_atom(key), val}
  end

  @doc """
  Retrieve the relevant results

  ## Examples

      RandomUser.Random.one |> RandomUser.Parser.results
  """

  def results(response) do
    if response && response.body do
      response.body["results"] |> List.first
    end
  end
end
