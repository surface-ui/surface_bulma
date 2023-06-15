defmodule SurfaceBulma.Catalogue.Navbar.Example02 do
  @moduledoc """
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "200px",
    direction: "vertical"

  alias SurfaceBulma.Button
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.{Brand, Buttons}
  alias SurfaceBulma.Link
  alias SurfaceBulma.Divider

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu" color="primary">
      <Brand>
        <Link href="http://www.phoenixframework.org">
          <img src="https://www.phoenixframework.org/images/phoenix-78c0fd3233522383ea9093ef877c8851.png?vsn=d">
        </Link>
      </Brand>
      <:nav_start>
        <Link href="/">Home</Link>
        <Link href="http://elixir-lang.org">Elixir</Link>
        <Navbar.Dropdown>
          <:label>More</:label>
          <Link href="/legal">Legal</Link>
          <Divider />
          <Link href="/legal">Legal</Link>
        </Navbar.Dropdown>
      </:nav_start>
      <:nav_end>
        <Buttons>
          <Button color="info">Account</Button>
          <Button color="light">Logout</Button>
        </Buttons>
      </:nav_end>
    </Navbar>
    """
  end
end
