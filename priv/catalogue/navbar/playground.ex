defmodule SurfaceBulma.Catalogue.Navbar.Playground do
  @moduledoc """
  """

  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Navbar,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "700px",
    direction: "vertical"

  alias SurfaceBulma.Button
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.Brand
  alias SurfaceBulma.Link
  alias SurfaceBulma.Divider
  alias SurfaceBulma.Buttons

  @props [
    color: "primary"
  ]

  def render(assigns) do
    ~F"""
    <Navbar id="main-menu" {...@props}>
      <Brand>
        <Link href="http://www.phoenixframework.org">
          <img src="https://www.phoenixframework.org/images/phoenix-78c0fd3233522383ea9093ef877c8851.png?vsn=d">
        </Link>
      </Brand>
      <:nav_start>
        <Link href="/">Home</Link>
        <Link href="http://elixir-lang.org">Elixir</Link>
        <Navbar.Dropdown arrowless?>
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
