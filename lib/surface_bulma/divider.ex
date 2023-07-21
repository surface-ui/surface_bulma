defmodule SurfaceBulma.Divider do
  use Surface.Component
  alias SurfaceBulma.{ClassProp, ContextClass}

  @moduledoc """
  A divider that can be used in a `Dropdown` or a `Navbar`. It will adapt based on the context.
  """
  use ClassProp
  use ContextClass

  def render(assigns) do
    ~F"""
    <hr class={classes(assigns)}>
    """
  end
end
