defmodule SurfaceBulma.Catalogue.Navbar.Example02 do
  @moduledoc """
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "700px",
    direction: "vertical"


  alias SurfaceBulma.Button
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.{Brand, Buttons, Start, End, Item}

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu" color="primary">
      <Brand path="https://h">
        <img src="https://www.phoenixframework.org/images/phoenix-78c0fd3233522383ea9093ef877c8851.png?vsn=d" />
      </Brand>
      <Start>
        <Item color="info">Home</Item>
        <Item redirect path="http://elixir-lang.org">Elixir</Item>
        <Item>
          More
          <Item>Legal</Item>
        </Item>
      </Start>
      <End>
        <Item>
          <Buttons>
            <Button color="info">Account</Button>
            <Button color="light">Logout</Button>
          </Buttons>
        </Item>
      </End>
    </Navbar>
    """
  end
end
