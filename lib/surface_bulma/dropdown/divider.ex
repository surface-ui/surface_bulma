defmodule SurfaceBulma.Dropdown.Divider do
  use Surface.Component, slot: "menu_items"

  @moduledoc """
  A divider in a dropdown menu
  """


  def render(assigns) do
    ~F"""
    <hr class="dropdown-divider">
    """
  end
end
