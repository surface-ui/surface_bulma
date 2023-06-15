import Config

config :phoenix, :json_library, Jason

import_config("contexts.exs")

config :esbuild,
  version: "0.13.8",
  catalogue: [
    args:
      ~w(../deps/surface_catalogue/assets/js/app.js --bundle --target=es2016 --minify --outdir=../priv/static/assets/),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :surface_catalogue, :assets_path, "/assets"
