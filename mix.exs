defmodule CcValidation.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cc_validation,
      version: "0.1.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),

      # Test
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],


      # Docs
      name: "CcValidation",
      source_url: "https://gitlab.com/mtchavez/ex_cc_validation",
      homepage_url: "https://gitlab.com/mtchavez/ex_cc_validation",
      docs: [
        main: "CcValidation", # The main page in the docs
        extras: ["README.md"]
      ]
  ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # Dev
      {:dogma, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},

      # Test
      {:excoveralls, "~> 0.7", only: :test}
    ]
  end

  defp description do
    """
    Validate credit card number format using Luhn Algorithm and allows for
    checking test card numbers.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :cc_validation,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["mtchavez"],
      licenses: ["MIT"],
      links: %{
        "Project Source Code" => "https://gitlab.com/mtchavez/ex_cc_validation"
      }
    ]
  end
end
