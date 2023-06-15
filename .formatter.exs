[
  import_deps: [:phoenix, :surface, :ecto],
  inputs: [
    "{mix,.formatter}.exs",
    "{config,lib,test}/**/*.{ex,exs,sface}",
    "priv/catalogue/**/*.{ex,sface}",
    "test/**/*.exs"
  ],
  plugins: [Surface.Formatter.Plugin]
]
