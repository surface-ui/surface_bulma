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
  alias SurfaceBulma.Navbar.{Brand, Buttons, Start, End}
  alias SurfaceBulma.Link
  alias SurfaceBulma.Divider

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu" color="primary">
      <Brand>
        <Link to="http://www.phoenixframework.org">
          <img src="https://www.phoenixframework.org/images/phoenix-78c0fd3233522383ea9093ef877c8851.png?vsn=d" />
        </Link>
      </Brand>
      <Start>
        <Link to="/">Home</Link>
        <Link to="http://elixir-lang.org">Elixir</Link>
        <Navbar.Dropdown>
          <:label>More</:label>
          <Link to="/legal">Legal</Link>
          <Divider />
          <Link to="/legal">Legal</Link>
        </Navbar.Dropdown>
      </Start>
      <End>
        <Buttons>
          <Button color="info">Account</Button>
          <Button color="light">Logout</Button>
        </Buttons>
      </End>
    </Navbar>
    """
  end
end
