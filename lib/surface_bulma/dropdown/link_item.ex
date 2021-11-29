defmodule SurfaceBulma.Dropdown.LinkItem do
  use Surface.Component, slot: "menu_items"

  @moduledoc """
  An item in the dropdown menu
  """

  @doc "Link target"
  prop to, :string, required: true

  @doc "Whether or not the item is active"
  prop active, :boolean

  @doc "Content of the list item"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <a href="#" class={"dropdown-item", "is-active": @active}>
      <#slot />
    </a>
    """
  end
end
