defmodule SurfaceBulma.ItemTest do
  use SurfaceBulma.ConnCase, async: true
  alias Surface.Components.Context

  test "item is rendered when class is set" do
    html  = render_surface do
      ~F"""
      <Context put={SurfaceBulma.Item, item_class: "test"}>
        <SurfaceBulma.Item>Test</SurfaceBulma.Item>
      </Context>
      """
    end

    assert html =~ ~r/class="test"/
  end
end
