defmodule SurfaceBulma.Navbar.Dropdown do
  use Surface.Component

  @doc "Whether to display the arrow next to the dropdown"
  prop arrowless?, :boolean, default: false

  slot label
  slot default

  def render(assigns) do
    ~F"""
    <Context put={SurfaceBulma.Link, context_class: "navbar-item"}>
      <div class="navbar-item has-dropdown is-hoverable">
        <div class={"navbar-link", "is-arrowless": @arrowless?}><#slot {@label} /></div>
        <div class="navbar-dropdown">
          <#slot />
        </div>
      </div>
    </Context>
    """
  end
end
