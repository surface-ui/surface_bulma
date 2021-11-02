defmodule SurfaceBulma.Catalogue.Navbar.Example01 do
  @moduledoc """
  
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "700px",
    direction: "vertical"


  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.{Start, End, Item}

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu">
      <Start>
        <Item>Home</Item>
        <Item>
          More
          <Item>Contact</Item>
          <Item>Legal</Item>
        </Item>
      </Start>
    </Navbar>
    """
  end
end
