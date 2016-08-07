defmodule RandomUser.Mixfile do
  use Mix.Project

  def project do
    [app: :random_user,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
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
      {:mock, "~> 0.1.3", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    Random User API client for Elixir applications.
    """
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
