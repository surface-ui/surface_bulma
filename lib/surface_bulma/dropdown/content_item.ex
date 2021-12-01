defmodule SurfaceBulma.Dropdown.ContentItem do
  use Surface.Component, slot: "menu_items"

  @moduledoc """
  A generic item for any content
  """

  @doc "Content of the list item"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class="dropdown-item">
      <#slot />
    </div>
    """
  end
end
