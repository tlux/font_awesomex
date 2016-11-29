defmodule FontAwesome.Mixfile do
  @moduledoc false

  use Mix.Project

  @description """
  A library that provides a helper to easily integrate Font Awesome into your
  Phoenix application.
  """

  def project do
    [app: :font_awesomex,
     version: "4.0.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: @description,
     package: package,

     # Docs
     name: "FontAwesome",
     source_url: "https://github.com/tlux/font_awesomex",
     docs: [main: "FontAwesome",
            extras: ["README.md"]]
   ]
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
    [{:phoenix_html, "~> 2.6"},
     {:credo, "~> 0.4", only: :dev},
     {:ex_doc, "~> 0.14", only: :dev}]
  end

  defp package do
    [
      name: :font_awesomex,
      files: [], # TODO
      maintainers: ["Tobias Casper"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/tlux/font_awesomex"
      }
    ]
  end
end
