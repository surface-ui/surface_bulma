defmodule SurfaceBulma.Navbar.Dropdown do
  use Surface.Component
  
  slot label
  slot default

  def render(assigns) do
    ~F"""
    <div class="navbar-item has-dropdown is-hoverable">
      <Context put={SurfaceBulma.Link, link_class: "navbar-link"}>
        <div class="navbar-link"><#slot name="label" /></div>
      </Context>
      <div class="navbar-dropdown">
      <Context put={SurfaceBulma.Link, link_class: "navbar-item"}>
        <#slot name="default" />
      </Context>
      </div>
    </div>
    """
  end
end
