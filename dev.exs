# iex -S mix dev

Logger.configure(level: :debug)
defmodule Surface.Catalogue.ErrorView do
  use Phoenix.View,
    root: "lib/surface/catalogue/templates",
    namespace: Surface.Catalogue
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
# Start the catalogue server
Surface.Catalogue.Server.start(
  render_errors: [view: Surface.Catalogue.ErrorView],
  live_reload: [
    patterns: [
      ~r"lib/surface_bulma/.*(ex)$"
    ]
  ]
)
