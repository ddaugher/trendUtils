defmodule TrendtUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :trend_utils,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      name: "trend_utils",
      source_url: "https://github.com/ddaugher/trendUtils",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:checkov, "~> 1.0"}
    ]
  end

  defp description() do
    "This algorithm is weighted towards non-zero values and numbers in the series that are changing. A value of zero and numbers in sequence that are the same value, are given less weight in the calculation. The algorithm will be a summing of results, for each pair within the list, shifted by one (1)."
  end

  defp package() do
    [
      # These are the default files included in the package
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/ddaugher/trendUtils"
      }
    ]
  end

end
