defmodule SurfaceBulma.MixProject do
  use Mix.Project

  @source_url "https://github.com/surface-ui/surface_bulma"
  @version "0.1.0"

  def project do
    [
      app: :surface_bulma,
      description: "A set of simple Surface components based on Bulma.",
      version: @version,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),
      aliases: aliases(),
      package: package()
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.25.0", only: :test},
      {:jason, "~> 1.0"},
      {:ecto, "3.5.5"},
      {:phoenix_ecto, "~> 4.1"},
      {:surface_font_awesome, "~> 0.1.1"},
      {:surface_catalogue, "~> 0.0.3", only: :dev},
      {:surface, "~> 0.2.1"}
    ]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*", "priv"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
