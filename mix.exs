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
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def catalogues do
    [
      "priv/catalogue",
      "deps/surface/priv/catalogue"
    ]
  end

  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:jason, "~> 1.0"},
      {:floki, "~> 0.25.0", only: :test},
      {:surface, "~> 0.2.1"},
      {:surface_font_awesome, "~> 0.1.1"},
      {:ecto, "3.5.5"},
      {:phoenix_ecto, "~> 4.1"},
      {:surface_catalogue, "~> 0.0.1", only: :dev}
    ]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end
end
