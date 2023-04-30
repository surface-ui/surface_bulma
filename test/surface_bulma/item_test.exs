defmodule SurfaceBulma.ItemTest do
  use SurfaceBulma.ConnCase, async: true
  alias Surface.Components.Context
  alias SurfaceBulma.Item

  test "item is rendered when class is set" do
    html =
      render_surface do
        ~F"""
        <Context
          put={SurfaceBulma.Item, context_class: "test"}
          put={SurfaceBulma.Item, context_tag: "div"}
        >
          <Item>Test</Item>
        </Context>
        """
      end

    assert html =~ ~r/class="test"/
    assert html =~ ~r/div/
    assert html =~ ~r/Test/
  end
end
