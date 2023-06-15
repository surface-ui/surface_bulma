defmodule SurfaceBulma.Form.Reset do
  @moduledoc """
  A thin wrapper around `Surface.Components.Form.Reset`
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form.Reset

  include(Reset)

  @impl true
  def render(assigns) do
    ~F"""
    <Reset {...included_props(assigns, Reset)} class={["button"] ++ (@class || [])} />
    """
  end
end
