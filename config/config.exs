use Mix.Config

config :phoenix, :json_library, Jason

config :surface, components: [
  {Surface.Components.Form.Field, [default_class: "field"]},
  {Surface.Components.Form.Label, [default_class: "label"]},
]
