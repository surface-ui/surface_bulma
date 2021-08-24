defmodule SurfaceBulma.Form.Reset do
  use SurfaceBulma.Component
  alias Surface.Components.Form.Reset

  include(Reset)

  @impl true
  def render(assigns) do
    ~F"""
      <Reset {...included_props(assigns)} class={["button"] ++ @class} />
    """
  end
end
