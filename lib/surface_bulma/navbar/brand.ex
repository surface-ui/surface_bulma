defmodule SurfaceBulma.Navbar.Brand do
  use Surface.Component, slot: "brand"

  prop path, :string

  @doc "The brand image or text you want displayed."
  slot default

  def render(assigns) do
    ~F"""
    <a class="navbar-item" href={@path}>
      <#slot />
    </a>
    """
  end
end
