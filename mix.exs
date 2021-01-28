defmodule SurfaceBulma.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_bulma,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def catalogues do
    ["priv/catalogue"]
  end

  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:jason, "~> 1.0"},
      {:floki, "~> 0.25.0", only: :test},
      {:surface, "~> 0.2.0"},
      {:surface_font_awesome, "~> 0.1.1"}
    ]
  end
end
