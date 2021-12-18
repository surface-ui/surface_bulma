defmodule SurfaceBulma.NavbarTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Link
  alias SurfaceBulma.Navbar
  alias SurfaceBulma.Navbar.{Brand, Item, Start, End}

  test "basic navbar with start and end" do
    html =
      render_surface do
        ~F"""
        <Navbar id="main-menu">
          <Start>
            <Link navigate="/">Home</Link>
          </Start>
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
          <Start>
            <Navbar.Dropdown>
              <:label><Link>More</Link></:label>
              <Link navigate="/users">Users</Link>
              <Link navigate="/settings">Settings</Link>
              <Link navigate="/settings">Settings</Link>
            </Navbar.Dropdown>
          </Start>
        </Navbar>
        """
      end

    assert html =~ ~r/redirect/
  end

  test "navbar brand sets SurfacBulma.Link context" do
    html = render_surface do
      ~F"""
      <Navbar id="main">
        <Brand>
          <Link to="test.com" />
        </Brand>
      </Navbar>
      """
    end

   assert html =~ ~r/navbar-item/
  end
end
