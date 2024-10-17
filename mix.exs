defmodule SurfaceBulma.MixProject do
  use Mix.Project

  @source_url "https://github.com/surface-ui/surface_bulma"
  @version "0.5.2"

  def project do
    [
      app: :surface_bulma,
      description: "A set of simple Surface components based on Bulma.",
      version: @version,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers() ++ [:surface],
      deps: deps(),
      aliases: aliases(),
      package: package(),
      docs: [
        groups_for_modules: [
          Elements: [
            ~r/SurfaceBulma.(Block|Box|Button|Content|Delete|Image|Notification|ProgressBars|Table|Tag|Title|SubTitle).*/
          ],
          Components: [
            ~r/SurfaceBulma.(BreadCrumb|Card|Dropdown|Menu|Message|Modal|Navbar|Pagination|Panel|Tabs).*/
          ],
          Form: [~r/SurfaceBulma.Form.*/],
          Icons: [~r/SurfaceBulma.Icon.*/]
        ],
        nest_modules_by_prefix: [SurfaceBulma.Form, SurfaceBulma.Icon]
      ]
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
      {:surface_catalogue, "~> 0.6.0", only: [:dev, :test]},
      {:phoenix_live_reload, "~> 1.3", only: [:dev]},
      {:surface_font_awesome, "~> 0.4.2"},
      {:surface_utils, "~> 0.2.0"},
      {:credo, "~> 1.5.6", only: :dev},
      {:surface, "~> 0.12.0"},
      {:surface_form_helpers, "~> 0.2.0"},
      {:phoenix_ecto, "~> 4.0", only: [:test, :dev]},
      {:ecto, "~> 3.12.2", only: [:test, :dev]},
      {:ex_fixer, "~> 1.0.0", only: [:test, :dev]}
    ]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end

  defp package() do
    [
      files: ["config", "lib", "mix.exs", "README*", "priv"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
