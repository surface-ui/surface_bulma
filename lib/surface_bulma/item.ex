defmodule SurfaceBulma.Item do
  @moduledoc """
  A general purpose component that can be re-used in other components such as the `Navbar` and `Dropdown`.
  """

  use Surface.Component
  slot default, required: true

  def render(assigns) do
    ~F"""
    <Context get={SurfaceBulma.Item, item_class: item_class}>
      <div class={item_class}>
        <#slot />
      </div>
    </Context>
    """
  end
end
