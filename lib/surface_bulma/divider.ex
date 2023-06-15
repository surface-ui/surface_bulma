defmodule SurfaceBulma.Divider do
  use Surface.Component

  @moduledoc """
  A divider that can be used in a `Dropdown` or a `Navbar`. It will adapt based on the context.
  """
  use SurfaceBulma.ContextClass
  prop class, :css_class, default: []

  def render(assigns) do
    ~F"""
    <hr class={@class ++ @context_class}>
    """
  end
end
