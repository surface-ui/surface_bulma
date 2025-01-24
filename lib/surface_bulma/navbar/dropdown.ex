defmodule SurfaceBulma.Navbar.Dropdown do
  use Surface.Component

  @doc "Whether to display the arrow next to the dropdown"
  prop arrowless?, :boolean, default: false

  slot label
  slot default

  def render(assigns) do
    ~F"""
    <div class="navbar-item has-dropdown is-hoverable">
      <div class={"navbar-link", "is-arrowless": @arrowless?}><#slot {@label} /></div>
      <div class="navbar-dropdown">
        <#slot context_put={SurfaceBulma.Link, context_class: "navbar-item"} />
      </div>
    </div>
    """
  end
end
