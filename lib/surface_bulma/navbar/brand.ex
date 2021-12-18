defmodule SurfaceBulma.Navbar.Brand do
  use Surface.Component, slot: "brand"

  @doc "Can contain `SurfaceBulma.Item` or a SurfaceBulma.Link."
  slot default

  def render(assigns) do
    ~F"""
    <Context
      put={SurfaceBulma.Link, link_class: "navbar-item"}
      put={SurfaceBulma.Item, item_class: "navbar-item"}>
      <#slot />
    </Context>
    """
  end
end
