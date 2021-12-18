defmodule SurfaceBulma.Divider do
  use Surface.Component

  @moduledoc """
  A divider that can be used in a `Dropdown` or a `Navbar`. It will adapt based on the context.
  """

  def render(assigns) do
    ~F"""
      <Context get={SurfaceBulma.Divider, divider_class: class}>
        <hr class={class || "divider" } />
      </Context>
    """
  end
end
