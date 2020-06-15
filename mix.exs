defmodule SurfaceBulma.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_bulma,
      version: "0.1.0",
      elixir: "~> 1.9",
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

  defp deps do
    [
      {:jason, "~> 1.0"},
      {:floki, "~> 0.25.0", only: :test},
      {:surface, "~> 0.1.0-alpha.2"}
    ]
  end
end
