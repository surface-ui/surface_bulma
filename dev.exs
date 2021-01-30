# iex -S mix dev

Logger.configure(level: :debug)

# Start the catalogue server
Surface.Catalogue.Server.start(
  live_reload: [
    patterns: [
      ~r"lib/surface_bulma/.*(ex)$"
    ]
  ]
)
