defmodule SurfaceBulma.Catalogue.Navbar.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "700px",
    direction: "vertical"

  alias SurfaceBulma.Link
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.{Start, End}

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu">
      <Start>
        <Link>Home</Link>
        <Navbar.Dropdown>
          <:label>More</:label>
          <Link>Contact</Link>
          <Link>Legal</Link>
        </Navbar.Dropdown>
      </Start>
    </Navbar>
    """
  end
end
