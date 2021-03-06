defmodule Chexes.Mixfile do
  use Mix.Project

  @description """
  None, funny module.
  """

  def project do
    [app: :chexes,
     version: "0.1.5",
     elixir: ">= 1.3.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: @description,
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
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
      {:credo, "~> 0.8", only: :dev},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.16", only: :dev},
      {:inch_ex, ">= 0.0.0",  only: :docs},
    ]
  end

  defp package do
    [maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
     licenses: ["MIT"],
     links: %{"github" => "https://github.com/ikeikeikeike/chexes"}]
  end

end
