defmodule RandomUser.Mixfile do
  use Mix.Project

  def project do
    [app: :random_user,
     version: "0.3.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     test_coverage: [tool: ExCoveralls],
      preferred_cli_env: cli_env_for(:test, [
        "coveralls", "coveralls.detail", "coveralls.post",
        "vcr", "vcr.delete", "vcr.check", "vcr.show"
      ]),]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpotion, "~> 3.0.0"},
      {:poison, ">= 2.2.0"},
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:excoveralls, "~> 0.4", only: :test},
      {:exvcr, "~> 0.6", only: :test},
      {:inch_ex, "~> 0.5", only: :docs},
      {:meck, "~> 0.8.2", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    Random User API client for Elixir applications.
    """
  end

  defp cli_env_for(env, tasks) do
    Enum.reduce(tasks, [], fn(key, acc) -> Keyword.put(acc, :"#{key}", env) end)
  end

  defp package do
    [
      name: :random_user,
      maintainers: ["Katherine Pe"],
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/katgironpe/random_user"
      }
    ]
  end
end
