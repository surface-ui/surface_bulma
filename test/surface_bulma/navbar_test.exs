defmodule SurfaceBulma.NavbarTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.{Link, Item}
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.Brand

  test "basic navbar with start and end" do
    html =
      render_surface do
        ~F"""
        <Navbar id="main-menu">
          <:nav_start>
            <Link navigate="/">Home</Link>
          </:nav_start>
        </Navbar>
        """
      end

    assert html =~ ~r/redirect/
    assert html =~ ~r/Home/
  end

  test "navbar can have dropdown menu" do
    html =
      render_surface do
        ~F"""
        <Navbar id="main-menu">
          <:nav_start>
            <Navbar.Dropdown>
              <:label><Link>More</Link></:label>
              <Link navigate="/users">Users</Link>
              <Link navigate="/settings">Settings</Link>
              <Link navigate="/settings">Settings</Link>
            </Navbar.Dropdown>
          </:nav_start>
        </Navbar>
        """
      end

    assert html =~ ~r/redirect/
  end

  test "navbar brand sets SurfacBulma.Link context" do
    html =
      render_surface do
        ~F"""
        <Navbar id="main">
          <Brand>
            <Link href="test.com" />
          </Brand>
        </Navbar>
        """
      end

    assert html =~ ~r/navbar-item/
  end

  test "navbar brand sets SurfacBulma.Item context" do
    html =
      render_surface do
        ~F"""
        <Navbar id="main">
          <Brand>
            <Item>Item</Item>
          </Brand>
        </Navbar>
        """
      end

    assert html =~ ~r/navbar-item/
  end
end
