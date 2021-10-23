defmodule SurfaceBulma.Components.Form.TelephoneInputTest do
  use SurfaceBulma.ConnCase

  alias SurfaceBulma.Form.TelephoneInput

  test "should use the correct type" do
    html = render_surface do
      ~F"""
        <TelephoneInput form="user" field="tel" />
      """
    end

    assert html =~ ~r/input .* type="tel"/
  end
end
