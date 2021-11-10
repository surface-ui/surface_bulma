defmodule SurfaceBulma.Dropdown.LinkItem do
  use Surface.Component, slot: "menu_items"

  @moduledoc """
  An item in the dropdown menu
  """

  @doc "Link target"
  prop to, :string, required: true

  @doc "Content of the list item"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <a href="#" class="dropdown-item">
      <#slot />
    </a>
    """
  end
end
