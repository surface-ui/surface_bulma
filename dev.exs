# iex -S mix dev

Logger.configure(level: :debug)

defmodule Surface.Catalogue.ErrorView do
  use Phoenix.Template,
    root: "deps/surface_catalogue/lib/surface/catalogue/templates/",
    namespace: Surface.Catalogue
end

defmodule Surface.Catalogue.Server.Router do
  use Phoenix.Router
  import Surface.Catalogue.Router

  surface_catalogue("/catalogue")
end

# Start the catalogue server
Surface.Catalogue.Server.start(
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:catalogue, ~w(--sourcemap=inline --watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"lib/surface_bulma/.*(ex)$",
      ~r"priv/catalogue/.*(ex)$"
    ]
  ],
)
