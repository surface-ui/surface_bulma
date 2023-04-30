defmodule SurfaceBulma.Catalogue.Navbar.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "200px",
    direction: "vertical"

  alias SurfaceBulma.Link
  alias SurfaceBulma.Navbar

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu">
      <:nav_start>
        <Link>Home</Link>
        <Navbar.Dropdown>
          <:label>More</:label>
          <Link>Contact</Link>
          <Link>Legal</Link>
        </Navbar.Dropdown>
      </:nav_start>
    </Navbar>
    """
  end
end
